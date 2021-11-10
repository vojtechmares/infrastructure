resource "gitlab_group" "mareshq" {
  name        = "MaresHQ"
  path        = "mareshq"
  description = "MaresHQ"
}

resource "gitlab_group" "statica_cloud" {
  name        = "Statica Cloud"
  path        = "statica-cloud"
  description = "Statica Cloud"
}
