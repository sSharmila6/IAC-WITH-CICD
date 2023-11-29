
##  Backend Bucket to store state files

-	I'm using Terraform setup a remote backend to manage state. I’ve setup a backend.tf file for the connection and declaration of GCS for the Terraform state files.

-	The backend.tf file declares a GCS bucket as the back end and provides the bucket, prefix, and credentials in the config.

-	The optional prefix is the GCS prefix inside the bucket. If it’s specified, Terraform stores the state as <prefix>/<workspace>.tfstate. If you don’t specify the prefix, it stores the state file in the root level of the GCS bucket
