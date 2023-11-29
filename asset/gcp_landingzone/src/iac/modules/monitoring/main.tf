resource "google_monitoring_notification_channel" "notification_email" {
  display_name = var.email
  type         = var.notification_type
  labels = {
      email_address = var.address_type
  }
}



resource "google_monitoring_alert_policy" "alert_policy_vm_CPU_utilization" {
  display_name = "GCE Instance CPU Utilization Alert "
  combiner     = var.combiner
  enabled = true
  project       = var.project_id
  documentation {
    content = "The rule  has generated this alert "
  }
  notification_channels = [
    "${google_monitoring_notification_channel.notification_email.name}"
  ]
  conditions {
    display_name = "CPU load is high"
    condition_threshold {
      filter        = "metric.type=\"compute.googleapis.com/instance/cpu/usage_time\" resource.type=\"gce_instance\"  resource.label.\"project_id\"=\"${var.project_id}\"  metric.label.\"instance_name\"=\"${var.pinstance_name}\"" 
      threshold_value = var.threshold
      comparison = "COMPARISON_GT"
      duration   = "600s"
      trigger {
        count = 1
      }
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }
  
  depends_on = [
    google_monitoring_notification_channel.notification_email
    
  ]
}




resource "google_monitoring_alert_policy" "alert_policy_gkenode_cpu_utilization" {
  display_name = "GKE Node CPU Utilization is above 90% (${var.project_id})"
  combiner     = var.combiner
  enabled = true
  project       = var.project_id
  documentation {
    content = "The rule has generated this alert "
  }
  notification_channels = [
    "${google_monitoring_notification_channel.notification_email.name}"
  ]
  conditions {
    display_name = "GKE Node CPU Utilization WARNING 90%"
    condition_threshold {
       filter     = "metric.type=\"kubernetes.io/node/cpu/allocatable_utilization\" AND resource.type=\"k8s_node\""
      threshold_value = var.threshold
      comparison = "COMPARISON_GT"
      duration   = "300s"
      trigger {
        count = 1
      }
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }
  
  depends_on = [
    google_monitoring_notification_channel.notification_email
    
  ]
}

