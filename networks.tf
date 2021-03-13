resource "unifi_network" "lan" {
  name              = "LAN"
  purpose           = "corporate"
  dhcp_dns          = ["10.0.1.8", "10.0.1.24"]
  dhcp_enabled      = true
  dhcp_start        = "10.0.1.2"
  dhcp_stop         = "10.0.1.200"
  domain_name       = "localdomain"
  ipv6_pd_interface = "wan"
  ipv6_ra_enable    = true
  subnet            = "10.0.1.0/24"
}

resource "unifi_network" "wan" {
  name                = "WAN"
  purpose             = "wan"
  wan_networkgroup    = "WAN"
  dhcp_lease          = 0
  wan_type            = "dhcp"
  ipv6_interface_type = ""
  network_group       = ""
}

