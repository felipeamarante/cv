# cv

![Build Status](https://codebuild.eu-west-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiczFzR0tiVWNGK09IWTJmUmhZTHdRUEVMOEVjMkdITDdsazFYdXQ0bW0venl5c2VNMVF4T1ZhSTIrS3JFcnN1ZDBVemxwOGtPMk04Wm5FREkwVWNXdUtJPSIsIml2UGFyYW1ldGVyU3BlYyI6IkNxYjJNUXZNaHBHSVFBSWIiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=master)

## What it is?
My CV Repository w/ an automatic build system which generates a html from json (using resume-cli).
http://cv.felipe.cloud

## Usage

  - Fork this repo, change your resume.json with your details obviously, push to your fork.
    - Schema can be found here : https://jsonresume.org/schema/  
  - Install latest version of terraform and configure properly with your AWS Access and Secret Keys
    - https://www.terraform.io/intro/getting-started/install.html
  - Change the variables at project.tf (Your repo https clone url, bucket name, GitHub Personal Access Token, resume theme)
    - Themes : https://jsonresume.org/themes/
    - Personal Access Token : https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/
  - terraform init
  - terraform apply
  - Build your project at CodeBuild, check if everything went as expected in the logs.
    - You can alternatively configure webhooks in your CodeBuild (not yet supported by TF)
  - Enjoy your new beautiful CV

  
Thanks  
Felipe A.



