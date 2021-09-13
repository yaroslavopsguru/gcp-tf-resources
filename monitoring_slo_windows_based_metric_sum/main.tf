resource "google_monitoring_custom_service" "customsrv" {
  service_id = "custom-srv-windows-slos-${local.name_suffix}"
  display_name = "My Custom Service"
}

resource "google_monitoring_slo" "windows_based" {
  service = google_monitoring_custom_service.customsrv.service_id
  display_name = "Terraform Test SLO with window based SLI"

  goal = 0.9
  rolling_period_days = 20

  windows_based_sli {
    window_period = "400s"
    metric_sum_in_range {
      time_series = join(" AND ", [
        "metric.type=\"monitoring.googleapis.com/uptime_check/request_latency\"",
        "resource.type=\"uptime_url\"",
      ])

      range {
        max = 5000
      }
    }
  }
}
