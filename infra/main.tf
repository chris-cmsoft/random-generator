variable "do_token" {}
variable "region" {}
variable "beast_count" {}
variable "beast_size" {}
variable "pug_count" {}
variable "pug_size" {}

provider "digitalocean" {
  token = "${var.do_token}"
}

resource "digitalocean_kubernetes_cluster" "full-blown-madness" {
  name    = "full-blown-madness"
  region  = "${var.region}"
  version = "1.15.3-do.1"

  node_pool {
    name       = "beast"
    size       = var.beast_size
    node_count = var.beast_count
  }
}

resource "digitalocean_kubernetes_node_pool" "pug" {
  cluster_id = "${digitalocean_kubernetes_cluster.full-blown-madness.id}"

  name       = "pug-pool"
  size       = var.pug_size
  node_count = var.pug_count
  tags       = ["pug"]
}
