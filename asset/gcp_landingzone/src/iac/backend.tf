terraform {

  backend "gcs" {

    bucket          =  "statefile_storagebuck"

    prefix          =  "/terraform.tfstate"
}
}