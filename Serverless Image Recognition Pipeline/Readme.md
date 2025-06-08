
---

## ⚙️ Setup Instructions

### 1. Create an S3 Bucket

Create an S3 bucket with two logical folders:

- `uploads/`: for image uploads that trigger processing.
- `metadata/`: where the generated JSON metadata files will be stored.

You can create these folders by uploading a dummy file to each path.

---

### 2. Create IAM Role for Lambda

Create an IAM role for the Lambda function with permissions to:

- Detect labels using Amazon Rekognition.
- Read images from S3.
- Write metadata files back to S3.
- Write logs to CloudWatch for monitoring and debugging.

---

### 3. Deploy the Lambda Function and Configure Trigger

- Create a Lambda function with the appropriate runtime.
- Attach the IAM role created above.
- Configure the Lambda function to trigger automatically on S3 `PUT` events targeting the `uploads/` folder in your bucket.
- The Lambda function will call Rekognition’s DetectLabels API to analyze each uploaded image and save the label data as a JSON file in the `metadata/` folder.

---

### 🐾 Output Example: Cat Not Explicitly Detected

Sometimes, Rekognition returns broad labels instead of very specific ones. For instance, an image of a cat might be labeled with terms like "Animal," "Mammal," "Pet," and "Feline" rather than explicitly "Cat." This can happen when the confidence score for the specific label is below the set threshold or when the image features are ambiguous.

---

## Tips for Improvement

- Lower the confidence threshold in the Lambda function to get more granular labels.
- Review CloudWatch logs to debug and refine detection.
- Adjust the maximum number of labels returned to capture more or fewer categories.


