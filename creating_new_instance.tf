terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.48.0"
    }
  }
}

provider "openstack" {
  user_name           = "ashokcha"
  password            = "Ashok@3098"
  auth_url            = "http://opencloud.rps.local/v2"
  user_domain_name    = "rps-r01-opencloud-01"
  project_domain_name = "devsecops"
}

# resource "openstack_compute_keypair_v2" "test-keypair" {
#   name = "ashok_kp"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzIjVrq2dPYFvCTvDdZ+pFaLgJwYwF+FOzK6o1TkM3Xs9cucHLEh/bJTFCeXo6oQn48jXJdLHJsQHsmex6eRMX6nrjDmcIMj219LCAoc72LmG1Ug41daDGH5p7HfBPKjsI5zO7tuRoaVyUs+yQq4uXD7Y9Q4deMCIJBfWwKMym3Buv++7WjPwyO8IEaWG7CZTiXmgftorzKYrzlWd0ikbBh5tiKmuZirVqCHQLGHPvQss+Kvb4yhxI81bphGfPHlAt2K8N82yAqfpmOsWvPiDXVfMZVbBL2yC5vrZ2C21LX/xZGVBWNLwWpdPOCL6YioPH4eTJBKvhcHA41BEHQeKD Generated-by-Nova"
# }

resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = "27c10ad2-9e1b-4172-91da-b70374a098d7"
  flavor_id       = "3"
  key_pair        = "ashok_m_kp_01"
  security_groups = ["default"]

  network {
    name = "devsecops_int_subnet_01"
  }
}
