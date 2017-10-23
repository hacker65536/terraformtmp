resource "aws_iam_role" "lambda_function" {
  name               = "lambda_function"
  assume_role_policy = "${module.lambda_assume.json}"
}

resource "aws_iam_role_policy" "lambda_function" {
  name_prefix = "lambda_function"
  role        = "${aws_iam_role.lambda_function.id}"
  policy      = "${data.aws_iam_policy_document.lambda_function.json}"
}

resource "aws_lambda_function" "lambda_function" {
  filename         = "zip/lambda_function.zip"
  function_name    = "lambda_function"
  role             = "${aws_iam_role.lambda_function.arn}"
  handler          = "index.lambda_handler"
  source_code_hash = "${base64sha256(file("zip/lambda_function.zip"))}"
  runtime          = "nodejs6.10"

  environment {
    variables = {
      var = "foo"
    }
  }

  depends_on = ["aws_iam_role.lambda_function"]
  tags       = "${var.tags}"
}

data "aws_iam_policy_document" "lambda_function" {
  statement {
    actions = [
      "dynamodb:BatchWriteItem",
    ]

    resources = ["arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/*"]
  }

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = [
      "arn:aws:logs:*:*:*",
    ]
  }
}
