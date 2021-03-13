resource "unifi_wlan" "opportunity" {
  name          = "Opportunity"
  security      = "wpapsk"
  user_group_id = unifi_user_group.default.id
  ap_group_ids  = [data.unifi_ap_group.default.id]
  network_id    = unifi_network.lan.id
  wlan_band     = "both"
  passphrase    = var.opportunity_pw
  no2ghz_oui    = false
}
