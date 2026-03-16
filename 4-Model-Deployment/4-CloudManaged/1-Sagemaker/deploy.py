import os
from sagemaker.sklearn.model import SKLearnModel

def load_env():
    if os.path.exists("env.properties"):
        with open("env.properties") as f:
            for line in f:
                if "=" in line and not line.startswith("#"):
                    k, v = line.strip().split("=", 1)
                    os.environ.setdefault(k, v)

load_env()

s3_bucket = os.environ.get("S3_BUCKET", "sagemaker-us-east-1-123456789012")
role = os.environ.get("SAGEMAKER_ROLE", "arn:aws:iam::123456789012:role/SageMakerRole")
instance_type = os.environ.get("INSTANCE_TYPE", "ml.m5.medium")
instance_count = int(os.environ.get("INSTANCE_COUNT", 1))

model = SKLearnModel(
    model_data=f"s3://{s3_bucket}/model.tar.gz",
    role=role,
    entry_point="inference.py",
    framework_version="0.23-1",
)

model.deploy(
    instance_count=instance_count,
    instance_type=instance_type,
)