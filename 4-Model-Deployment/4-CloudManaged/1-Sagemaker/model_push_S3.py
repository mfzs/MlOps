import boto3
import joblib
from sklearn.datasets import load_iris
from sklearn.tree import DecisionTreeClassifier
import os

def load_env():
    if os.path.exists("env.properties"):
        with open("env.properties") as file:
            for line in file:
                if "=" in line and not line.startswith("#"):
                    k, v = line.strip().split("=", 1)
                    os.environ.setdefault(k, v)

load_env()

iris = load_iris()
X, y = iris.data, iris.target

model = DecisionTreeClassifier()
model.fit(X, y)

model_name = os.environ.get("MODEL_NAME", "iris-model.pkl")
joblib.dump(model, model_name)

print(f"Model saved as {model_name}")


# Push the Model
s3 = boto3.client("s3")
bucket = os.environ.get("S3_BUCKET", "")

if bucket:
    s3.upload_file(model_name, bucket, f"model-artifacts/{model_name}")
    print("Uploaded to S3:", f"s3://{bucket}/model-artifacts/{model_name}")
else:
    print("S3_BUCKET not found in environment or env.properties. Skipping S3 upload.")


# Push the Tar Model
s3.upload_file(
    "model.tar.gz",
    bucket,
    "model-artifacts/model.tar.gz"
)

print("Packaged model uploaded to S3")