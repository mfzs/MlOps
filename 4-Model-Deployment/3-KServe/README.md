# Kserve

## What is Kserve

- Open source platform based on K8s
- Helps with model deployment, serving, inference and autoscaling
- Support different frameworks
    - scikitlearn (.pkl)
    - tensorflow
    - xgboost
    - pytorch
    - onnx
    - triton
- Knative
- Supports Keda


## Kserve Architecture

### Control Plane
- InferenceService CRD - Manages model serving lifecycle
- InferenceGraph CRD - Orchestrates model ensembles and chaining workflows
- Serving Runtime - Pluggable model runtime implementations
- ClusterServingRuntime: Define cluster-wide model runtimes
- LocalModelCache CRD - Cache large models locally on nodes for faster startup and scaling
- Model Storage - Support for various storage systems (Huggingface, S3, GCS, Azure, PVC, etc.)

### Data Plane
- Predictor - Serves model predictions
- Transformer - Pre/post processing logic
- Explainer - Model explanations and interpretability

## Installation
- Install cert-manager (you can install using add on ass)
```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/latest/download/cert-manager.yaml
```

- Install KServe CRD
```
kubectl create namespace kserve

helm upgrade --install kserve-crd oci://ghcr.io/kserve/charts/kserve-crd \
  --version v0.16.0 \
  -n kserve \
  --wait
  ```

- Install Kserve
```
helm upgrade --install kserve oci://ghcr.io/kserve/charts/kserve \
  --version v0.16.0 \
  -n kserve \
  --set kserve.controller.deploymentMode=RawDeployment \
  --wait
```
- Install a sample model
    - Once you deploy a model kserve will identified the model and reconile it

```
kubectl create namespace intent

cat <<EOF | kubectl apply -n intent -f -
apiVersion: serving.kserve.io/v1beta1
kind: InferenceService
metadata:
  name: intent-classifier
spec:
  predictor:
    model:
      modelFormat:
        name: sklearn
      storageUri: "gs://kserving-example/models/sklearn/1.0/model"
      resources:
        requests:
          cpu: "100m"
          memory: "512Mi"
        limits:
          cpu: "1"
          memory: "1Gi"
EOF

kubectl get inferenceservice intent-classifier -n intent
```


# [*] Ref
- https://kserve.github.io/website/
- 
