variable "zone_id" {
  type        = string
  description = "Cloudflare zone ID"
}

variable "zone_name" {
  type        = string
  description = "Apex domain of the zone, e.g. example.com"
}

variable "target_url" {
  type        = string
  description = "Absolute URL that every request is redirected to"
}

variable "status_code" {
  type        = number
  description = "HTTP status code used for the redirect"
  default     = 301
}

variable "preserve_query_string" {
  type        = bool
  description = "Whether to append the original query string to the target URL"
  default     = false
}
