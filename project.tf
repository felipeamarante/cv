provider "aws" {
    region = "eu-west-1"
}

variable "bucket_name" {
  default = "cv.tesemdogtraining.ga"
  type = "string"
}

variable "resume_theme" {
  default = "stackoverflow"
  type = "string"
}

variable "github_repo" {
  default = "https://github.com/Seblat5ch/cv.git"
  type = "string"
}

variable "github_token" {
  default = "193265022b7d3102efde222795277b5da1769ae2 "
  type = "string"
}

resource "aws_iam_role" "codebuild_role" {
  name = "codebuild-role-cv"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}"
  acl    = "public-read"


website {
    index_document = "index.html"
    error_document = "index.html"
}
}

resource "aws_s3_bucket_policy" "bucket" {
  bucket = "${aws_s3_bucket.bucket.id}"
  policy = <<BKTPOLICY
{
  "Version":"2012-10-17",
  "Statement":[{
	"Sid":"PublicReadGetObject",
        "Effect":"Allow",
	  "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["${aws_s3_bucket.bucket.arn}/*"
      ]
    }
  ]
}
BKTPOLICY
}

resource "aws_iam_policy" "codebuild_policy" {
  name        = "codebuild-policy"
  path        = "/service-role/"
  description = "Policy used in trust relationship with CodeBuild"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
    },
     {
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.bucket.arn}","${aws_s3_bucket.bucket.arn}/*"
      ],
      "Action": [
        "s3:*"
      ]
    }
  ]
}
POLICY
}


resource "aws_iam_policy_attachment" "codebuild_policy_attachment" {
  name       = "codebuild-policy-attachment"
  policy_arn = "${aws_iam_policy.codebuild_policy.arn}"
  roles      = ["${aws_iam_role.codebuild_role.id}"]
}


resource "aws_codebuild_project" "CodeBuildProject" {
  name         = "MyCvTest"
  description  = "Build your Json Resume with CodeBuild and Ship it to S3"
  build_timeout      = "5"
  service_role = "${aws_iam_role.codebuild_role.arn}"

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/nodejs:6.3.1"
    type         = "LINUX_CONTAINER"

    environment_variable {
      "name"  = "bucket"
      "value" = "${var.bucket_name}"
    }

    environment_variable {
      "name"  = "theme"
      "value" = "${var.resume_theme}"
    }
    }


  source {
    type     = "GITHUB"
    location = "${var.github_repo}"

    auth {
    type = "OAUTH"
    }
  }
}

