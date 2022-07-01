# 1. IAM POLICY
resource "aws_iam_policy" "policy_for_master_role" {
  name        = "policy_for_master_role"
  policy      = file("./modules/IAM/policy_for_master.json")
}

resource "aws_iam_policy" "policy_for_worker_role" {
  name        = "policy_for_worker_role"
  policy      = file("./modules/IAM/policy_for_worker.json")
}
#2. IAM ROLES 
resource "aws_iam_role" "role_for_master" {
  name = "role_master_k8s"

  # Terraform "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "role_for_master"
  }
}

resource "aws_iam_role" "role_for_worker" {
  name = "role_worker_k8s"

  # Terraform "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "role_for_worker"
  }
}
# 3. ROLE VE POLICY BIR BIRINE BAGLIYORUZ 
resource "aws_iam_policy_attachment" "attach_for_master" {
  name       = "attachment_for_master" # MASTER
  roles      = [aws_iam_role.role_for_master.name] #ROLE
  policy_arn = aws_iam_policy.policy_for_master_role.arn # POLICY
}

resource "aws_iam_policy_attachment" "attach_for_worker" {
  name       = "attachment_for_worker" # WORKER
  roles      = [aws_iam_role.role_for_worker.name] # ROLE
  policy_arn = aws_iam_policy.policy_for_worker_role.arn # POLICY
}
# EC2'LARA BU ROLE'LERI BAGLIYORUZ
resource "aws_iam_instance_profile" "profile_for_master" {
  name  = "profile_for_master"
  role = aws_iam_role.role_for_master.name
}

resource "aws_iam_instance_profile" "profile_for_worker" {
  name  = "profile_for_worker"
  role = aws_iam_role.role_for_worker.name
}

output master_profile_name {
  value       = aws_iam_instance_profile.profile_for_master.name
}

output worker_profile_name {
  value       = aws_iam_instance_profile.profile_for_worker.name
}
