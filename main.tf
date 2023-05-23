terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.32.0"
    }
  }
}

data "google_iam_policy" "secret_accessor" {
  binding {
    role = "roles/secretmanager.secretAccessor"
    members = [
      "serviceAccount:${var.service_account}",
    ]
  }
}

resource "google_secret_manager_secret" "secret" {
  secret_id = var.secret_key
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "value" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.secret_value
}

resource "google_secret_manager_secret_iam_policy" "policy" {
  project     = google_secret_manager_secret.secret.project
  secret_id   = google_secret_manager_secret.secret.secret_id
  policy_data = data.google_iam_policy.secret_accessor.policy_data
}
