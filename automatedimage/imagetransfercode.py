import boto3

def lambda_handler(event, context):
    # Get the source and destination bucket names from the event
    source_bucket = event['Records'][0]['s3']['bucket']['name']
    source_key = event['Records'][0]['s3']['object']['key']
    destination_bucket = 'your-destination-bucket'

    # Download the image from the source bucket
    s3 = boto3.client('s3')
    response = s3.get_object(Bucket=source_bucket, Key=source_key)
    image_data = response['Body'].read()

    # Upload the image to the destination bucket
    s3.put_object(Bucket=destination_bucket, Key=source_key, Body=image_data)

    return {
        'statusCode': 200,
        'body': 'Image copied successfully'
    }
