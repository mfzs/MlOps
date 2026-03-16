import tarfile
import os

def load_env():
    if os.path.exists("env.properties"):
        with open("env.properties") as file:
            for line in file:
                if "=" in line and not line.startswith("#"):
                    k, v = line.strip().split("=", 1)
                    os.environ.setdefault(k, v)

load_env()

model_name = os.environ.get("MODEL_NAME", "iris-model.pkl")

with tarfile.open("model.tar.gz", "w:gz") as tar:
    if os.path.exists(model_name):
        tar.add(model_name)
    else:
        print(f"Warning: {model_name} does not exist. Please create it first.")
    tar.add("inference.py")

print("model.tar.gz created")