provider "aws" {
  region = "us-east-2"
}
resource "aws_amplify_app" "example3" {
  name       = "example3"
  repository = "https://github.com/Gunamoni11/tf_amplifier.git"
  #access_token = "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"

  
  data.aws_ssm_parameter.foo.value  
  
data "aws_ssm_parameter" "foo" {
  name = "/github/access_token"
}


  # The default build_spec added by the Amplify Console for React.
  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        preBuild:
          commands:
            - yarn install
        build:
          commands:
            - yarn run build
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT

  # The default rewrites and redirects added by the Amplify Console.
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }

  environment_variables = {
    ENV = "test"
  }
}
