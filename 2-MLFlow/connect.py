import mlflow
import os

# Define variables (can also come from environment variables)
tracking_uri = os.getenv("MLFLOW_TRACKING_URI", "http://localhost:5555")
experiment_name = os.getenv("MLFLOW_EXPERIMENT_NAME", "my_first_mlflow_experiment")

# Set MLflow configuration
mlflow.set_tracking_uri(tracking_uri)
mlflow.set_experiment(experiment_name)

print(f"Tracking URI set to: {tracking_uri}")
print(f"Experiment set to: {experiment_name}")