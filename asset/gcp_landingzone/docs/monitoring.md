Monitoring for CPU usage and GKE Node CPU Utilization

The script creates the following resources in the monitoring project:
          1. Creates Alert Policies for CPU utilization
          2. Creates Alert Policies for Gke node cpu utilization
          3. Sends Notification to Notification channel when it reaches to threshold value.

Implementation steps
Follow these steps:

 1.Clone this repository or to a local file system
 2.update monitoring_project variable and  threshold value set to the values for your projects
 3.Ensure that GOOGLE_PROJECT environment variable holds the project ID of the Monitoring Project
 4.Ensure that your Terraform Google provider is authenticated and has access to the following permissions:
 5.roles/monitoring.editor permission in Monitoring Project
 6.roles/monitoring.viewer, roles/logging.viewer in all Monitored Projects
 7.Apply the Terraform configuration
 8.Monitoring is now available in Cloud Console, Monitoring > Alerting > Policies 
