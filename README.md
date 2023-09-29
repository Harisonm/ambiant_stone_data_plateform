# Configuration GCP

## Local part

### GCP authentification
```
gcloud auth application-default login
```

### Container registry
```
gcloud auth configure-docker europe-west1-docker.pkg.dev
```

```
gcloud auth configure-docker
```

Create bucket for all data use to platform

Go to terraform/dbt/google_storage and launch commande line : 
```
terraform init
terraform plan
terraform apply
```
Create Service account with specific role for dbt

Go to terraform/dbt/big_query and launch commande line : 
```
terraform init
terraform plan
terraform apply
```

https://stackoverflow.com/questions/61829214/how-to-export-kubeconfig-file-from-existing-cluster
https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl?hl=fr#generate_kubeconfig_entry