This directory contains the architecture diagrams, code files, and images for the project.
Contents

    Architecture Diagrams: Visual representations of the system architecture and data flows.
       imagetransfer.png
       capstone.png
       Source Code: Main source code files for the project.
        imagetransfercode.py: This AWS Lambda function copies an uploaded image from a source S3 bucket to a specified destination S3 bucket.
               Imports: Imports the boto3 library to interact with AWS services.
               Function Definition: Defines the lambda_handler function as the entry point for the Lambda execution.
               Event Data Retrieval: Extracts the source bucket name and object key from the incoming event data.
               Download the Image: Uses boto3 to get the image object from the source bucket.
               Upload to Destination: Uploads the retrieved image to the specified destination bucket.
      
       
