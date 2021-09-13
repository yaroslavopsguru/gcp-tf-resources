resource "google_compute_resource_policy" "foo" {
  name   = "policy-${local.name_suffix}"
  region = "us-central1"
  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = 1
        start_time    = "04:00"
      }
    }
  }
}
