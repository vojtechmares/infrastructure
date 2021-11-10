resource "gitlab_group" "mareshq" {
  name        = "MaresHQ"
  path        = "mareshq"
  description = "MaresHQ"
}

resource "gitlab_group" "staticahq" {
  name        = "StaticaHQ"
  path        = "staticahq"
  description = "StaticaHQ"
}
