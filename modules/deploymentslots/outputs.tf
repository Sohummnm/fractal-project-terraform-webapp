output "slot_hostnames" {
  value = {
    for k, v in azurerm_linux_web_app_slot.this :
    k => v.default_hostname
  }
}
