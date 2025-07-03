
# AWS S3 Image Thumbnail Generator with Lambda

This project automatically generates thumbnails (128x128 px) for images uploaded to an S3 bucket using an AWS Lambda function with the Pillow image processing library.

---

## Architecture Overview

- **S3 Bucket:** Stores original images and thumbnails (in a `thumbnails/` prefix folder).
- **Lambda Function:** Triggered on new image uploads to S3, generates a thumbnail, and saves it back to the same bucket under `thumbnails/`.
- **Lambda Layer:** Contains the Pillow library, packaged as a Lambda layer to enable image processing in the Lambda environment.
- **IAM Roles & Policies:** Grant Lambda permissions to read/write objects in S3 and allow S3 to invoke the Lambda function.

---

## Prerequisites

- AWS CLI configured or access to AWS Console
- Python 3.9 runtime knowledge
- Basic familiarity with AWS Lambda, S3, and IAM
- Access to AWS CloudShell or local terminal for packaging the Pillow layer

---

## Setup Instructions

### 1. Prepare Pillow Lambda Layer

```bash
# Create folder structure expected by Lambda
mkdir -p pillow-layer/python/lib/python3.9/site-packages

# Install Pillow package into that folder
pip3 install Pillow -t pillow-layer/python/lib/python3.9/site-packages/

# Zip the layer folder
cd pillow-layer
zip -r9 ../pillow-layer.zip python
cd ..
````

Upload `pillow-layer.zip` as a Lambda layer in AWS Console or via AWS CLI:

```bash
aws lambda publish-layer-version --layer-name Pillow-Layer --zip-file fileb://pillow-layer.zip --compatible-runtimes python3.9
```

---

### 2. Create S3 Bucket

* Create bucket (e.g., `awstraining-image-uploads`)
* Enable event notifications for `s3:ObjectCreated:*` on the bucket to trigger Lambda

---

### 3. Deploy Lambda Function

* Create a new Lambda function (Python 3.9 runtime)
* Attach the Pillow Lambda layer created above
* Use this handler code (`lambda_function.py`):

```python
import boto3
from PIL import Image
import io

s3 = boto3.client('s3')
THUMBNAIL_BUCKET = "awstraining-image-uploads"  # Same bucket as source

def lambda_handler(event, context):
    source_bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    if key.startswith("thumbnails/"):
        return  # Prevent recursion

    try:
        response = s3.get_object(Bucket=source_bucket, Key=key)
        image_data = response['Body'].read()
        image = Image.open(io.BytesIO(image_data))

        image.thumbnail((128, 128))
        buffer = io.BytesIO()
        image.save(buffer, format=image.format)
        buffer.seek(0)

        thumbnail_key = f"thumbnails/{key}"
        s3.put_object(
            Bucket=THUMBNAIL_BUCKET,
            Key=thumbnail_key,
            Body=buffer,
            ContentType=response['ContentType']
        )

        return {
            'statusCode': 200,
            'body': f"Thumbnail saved to {THUMBNAIL_BUCKET}/{thumbnail_key}"
        }

    except Exception as e:
        print(f"Error: {str(e)}")
        raise
```

---

### 4. Configure IAM Roles and Permissions

* Lambda execution role must allow:

  * `s3:GetObject` and `s3:PutObject` on the bucket 
* Add resource-based policy to Lambda function to allow S3 invoke:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": { "Service": "s3.amazonaws.com" },
      "Action": "lambda:InvokeFunction",
      "Resource": "arn:aws:lambda:REGION:ACCOUNT_ID:function:FUNCTION_NAME",
      "Condition": {
        "StringEquals": {
          "AWS:SourceAccount": "ACCOUNT_ID"
        },
        "ArnLike": {
          "AWS:SourceArn": "arn:aws:s3:::bucket-name"
        }
      }
    }
  ]
}
```

Replace `REGION`, `ACCOUNT_ID`, and `FUNCTION_NAME` accordingly.

---

## Challenges and Fixes

* **ModuleNotFoundError: No module named 'PIL'**

  * **Cause:** Pillow is not included by default in Lambda.
  * **Fix:**  
    - Package Pillow into a Lambda Layer using the correct folder structure (`python/lib/python3.9/site-packages/`).  
    - Build the layer in an environment compatible with AWS Lambda (e.g., AWS CloudShell or Amazon Linux).  
    - Attach the created layer to your Lambda function.

* **ImportError: cannot import name '_imaging'**

  * **Cause:** Pillow layer was built for a different operating system or Python version than the Lambda runtime.
  * **Fix:**  
    - Use AWS CloudShell or an Amazon Linux EC2 instance to build the Pillow layer, ensuring native dependencies match the Lambda environment.

* **KeyError: 'Records'**

  * **Cause:** The Lambda function expects the event to contain an S3 event structure with the 'Records' key.
  * **Fix:**  
    - Test your Lambda function by uploading a file to the S3 bucket to trigger the real event.  
    - If testing manually, use a properly structured mock S3 event JSON.

* **NoSuchKey error**

  * **Cause:** Lambda tried to access an S3 object key that does not exist (maybe due to incorrect event key or timing issues).
  * **Fix:**  
    - Verify the S3 event's object key is correct.  
    - Check that the file was successfully uploaded before Lambda tries to read it.  
    - Add error handling in the Lambda code to log missing keys gracefully.

* **Infinite recursion (Lambda triggers itself repeatedly)**

  * **Cause:** Lambda saves the thumbnail back into the same bucket and triggers itself again.
  * **Fix:**  
    - Add logic in Lambda to ignore objects in the `thumbnails/` folder (e.g., `if key.startswith("thumbnails/"): return`).

---

These fixes help ensure the Lambda function runs smoothly and handles edge cases effectively.


## Cleaning Up

To avoid ongoing costs:

* Delete the Lambda function and layer
* Remove event triggers
* Delete or archive your S3 bucket data
* Remove IAM roles or policies if not reused

---


