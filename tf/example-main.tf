data "external" "curl_command" {
  program = ["bash", "get_gcp_token.sh"]
}

output "token_lookup_status" {
  value = data.external.curl_command.result.status
}

provider "google" {
  access_token = data.external.curl_command.result.token
}

resource "google_storage_bucket" "some_bucket" {
  name                        = "some-bucket"
  project                     = "some-project"
  location                    = "US"
  force_destroy               = true
  uniform_bucket_level_access = true
}

output "bucket" {
  value = google_storage_bucket.some_bucket
}
