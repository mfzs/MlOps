# Deployement & Serving
---

## What is Deployement & Serving
   - It is the process of making a machine learning model available for use in a production environment.
   - Runtime
   - Resources
   - Ingress/LB
   - Autoscaling
   - CDN

## Ways to Deploy
   - Virtual Machine
        - Artifacts Store in VM, API is being served via flask/FastAPI, Autoscaling
   - K8s
        - Container, POD, SVC, Ingress
   - Cloud Service Managed Service (AWS SageMaker, Azure ML, GCP AI Platform)
        - Minimum Setup Required, as being managed by Cloud Provider
        - No control over the infrastructure
   - KServe
        - Underline being used K8s
        - CRDs
        - Build in canary capablities

   
## REF
* 