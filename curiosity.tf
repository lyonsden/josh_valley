resource "unifi_wlan" "curiosity" {
  name          = "Curiosity"
  security      = "wpapsk"
  user_group_id = unifi_user_group.default.id
  ap_group_ids  = [data.unifi_ap_group.default.id]
  network_id    = unifi_network.lan.id
  wlan_band     = "both"
  passphrase    = var.curiosity_pw

  dynamic "schedule" {
    for_each = ["mon", "tue", "wed", "thu"]
    content {
      block_end   = var.school_night_end
      block_start = var.school_night_start
      day_of_week = schedule.value
    }
  }
  schedule {
    block_end   = "23:00"
    block_start = var.school_night_start
    day_of_week = "fri"
  }
  schedule {
    block_end   = "22:00"
    block_start = var.school_night_start
    day_of_week = "sat"
  }
  schedule {
    block_end   = var.school_night_end
    block_start = var.school_night_start
    day_of_week = "sun"
  }
}
