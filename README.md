# cv - DEPRECATED. Please check https://github.com/felipeamarante/felipeamarante.github.io

![Build Status](https://codebuild.eu-west-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiczFzR0tiVWNGK09IWTJmUmhZTHdRUEVMOEVjMkdITDdsazFYdXQ0bW0venl5c2VNMVF4T1ZhSTIrS3JFcnN1ZDBVemxwOGtPMk04Wm5FREkwVWNXdUtJPSIsIml2UGFyYW1ldGVyU3BlYyI6IkNxYjJNUXZNaHBHSVFBSWIiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=master)

## What it is?
My CV Repository w/ an automatic build system which generates a html from json (using resume-cli).
http://cv.felipe.cloud

## Usage

  - Fork this repo, change your resume.json with your details obviously, push to your fork.
    - Schema can be found here : https://jsonresume.org/schema/  
  - Install latest version of terraform and configure properly with your AWS Access and Secret Keys
    - https://www.terraform.io/intro/getting-started/install.html
  - Change the variables at project.tf (Your repo https clone url, bucket name, resume theme)
    - Themes : https://jsonresume.org/themes/
  - You also need to connect your GitHub account with your CodeBuild:
    - Instructions : You must connect your AWS account to your GitHub account. To do this, use the AWS CodeBuild console to create a build project. When you use the console to connect (or reconnect) with GitHub, on the GitHub Authorize application page, for Organization access, choose Request access next to each repository you want AWS CodeBuild to be able to access. Choose Authorize application. (After you have connected to your GitHub account, you do not need to finish creating the build project. You can close the AWS CodeBuild console.) To instruct AWS CodeBuild to use this connection, in the source object, set the auth object's type value to OAUTH. 
  - terraform init
  - terraform apply
  - Build your project at CodeBuild, check if everything went as expected in the logs.
    - You can alternatively configure webhooks in your CodeBuild (not yet supported by TF)
  - Enjoy your new beautiful CV

  
Thanks  
Felipe A.



