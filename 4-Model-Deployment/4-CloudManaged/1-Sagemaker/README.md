# Sagemaker 

## Sagemaker/Sagemaker Ai

- **AWS** rebranded sagemaker as sagemaker ai
- It is a managed service and have all required underlying infra needed for ML works
- Domain 
    - Can have multiple apps
    - Domains is for the team/app segregation
    - For user profiles we can set up individual access
- Studio
- RStudio
- Jupyter Notebook

- **Cons**
- High Cost 
- Vendor Locking
- 

## How to setup SageMaker

### PreRequisite
- VPC
- Subnets
- 

**Steps**
- create a trust relationship
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "sagemaker.amazonaws.com"
            }   
        }
    ]
}
```

- Attach the role to the sagemaker service
  - AmazonSageMakerFullAccess
  - Attach to the trust relationship created in the previous step
- Create Domain (if multiple App/Team we can have multiple Domain)
  - Add a Role which have permission to all the required services
- Create User Profile (for individual access)
  - Roles Based on the user profile (ABAC)
    - ML Engineer - Jupyter Notebook
    - MLOps Engineer - Like pipelines, model registry, monitoring, etc
    - For every profile we need to pass tag in key value profile and then attach the same tag to the user
    ```
    profile: ml-engineer
    ```
    - 
- Create App (Studio/RStudio/Jupyter Notebook)
- 