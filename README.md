# cv

![Build Status](https://codebuild.eu-west-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiczFzR0tiVWNGK09IWTJmUmhZTHdRUEVMOEVjMkdITDdsazFYdXQ0bW0venl5c2VNMVF4T1ZhSTIrS3JFcnN1ZDBVemxwOGtPMk04Wm5FREkwVWNXdUtJPSIsIml2UGFyYW1ldGVyU3BlYyI6IkNxYjJNUXZNaHBHSVFBSWIiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=master)

## What it is?
My CV Repository w/ an automatic build system which generates a html from json (using resume-cli).
http://cv.felipe.cloud

## Usage

  - Clone this repo, change your resume.json with your details obviously  
    - Schema can be found here : https://jsonresume.org/schema/  
  - Select your bucket and your theme, then populate at environment variables in buildspec.yml  
    - Themes -> https://jsonresume.org/themes/  
  - Create a CodeBuild Project in your AWS Account and Reference your Github Repository. You can enable webhooks if you want this to happen in automated fashion  
    - https://docs.aws.amazon.com/codebuild/latest/userguide/create-project.html  
  - Have fun!  

Thanks  
Felipe A.



