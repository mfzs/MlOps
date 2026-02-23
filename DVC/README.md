# DVC - Data Version Control
---

## What is DVC
   - It is way to version control large files like datasets and models.
   - Remote Storage like S3, GCS, Azure Blob Storage, etc.
   - 

## What is the need of DVC 
  - Git is not designed for versioning large files like datasets and models. 
  - Git become Slow when dealing with large files.
  - 


## DVC Commands
- to add your current repo to dvc
```
dvc init --subdir # if you are in a subdirectory of a parent SCM repository
```

- to  add your current data to dvc
```
dvc add
```

- to commit the changes to git
```
git add data/.gitignore data/data.csv.dvc
```

- to push your current data to dvc
```
dvc push
```

- To add a remote location
```
dvc remote add -d remote_name s3://mlops-firoz-demo/dvc
```