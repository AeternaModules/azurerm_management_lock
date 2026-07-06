output "management_locks" {
  description = "All management_lock resources"
  value       = azurerm_management_lock.management_locks
}
output "management_locks_lock_level" {
  description = "List of lock_level values across all management_locks"
  value       = [for k, v in azurerm_management_lock.management_locks : v.lock_level]
}
output "management_locks_name" {
  description = "List of name values across all management_locks"
  value       = [for k, v in azurerm_management_lock.management_locks : v.name]
}
output "management_locks_notes" {
  description = "List of notes values across all management_locks"
  value       = [for k, v in azurerm_management_lock.management_locks : v.notes]
}
output "management_locks_scope" {
  description = "List of scope values across all management_locks"
  value       = [for k, v in azurerm_management_lock.management_locks : v.scope]
}

