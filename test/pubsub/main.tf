resource "google_pubsub_topic" "example" {
  project = var.project_id
  name    = "example-topic"
  
  depends_on = [google_project_service.cloudresourcemanager, google_project_service.pubsub]
}

resource "google_pubsub_subscription" "example" {
  project = var.project_id
  name    = "example-subscription"
  topic   = google_pubsub_topic.example.name
}
