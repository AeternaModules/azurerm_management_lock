output "management_locks_id" {
  description = "Map of id values across all management_locks, keyed the same as var.management_locks"
  value       = { for k, v in azurerm_management_lock.management_locks : k => v.id if v.id != null && length(v.id) > 0 }
}
output "management_locks_lock_level" {
  description = "Map of lock_level values across all management_locks, keyed the same as var.management_locks"
  value       = { for k, v in azurerm_management_lock.management_locks : k => v.lock_level if v.lock_level != null && length(v.lock_level) > 0 }
}
output "management_locks_name" {
  description = "Map of name values across all management_locks, keyed the same as var.management_locks"
  value       = { for k, v in azurerm_management_lock.management_locks : k => v.name if v.name != null && length(v.name) > 0 }
}
output "management_locks_notes" {
  description = "Map of notes values across all management_locks, keyed the same as var.management_locks"
  value       = { for k, v in azurerm_management_lock.management_locks : k => v.notes if v.notes != null && length(v.notes) > 0 }
}
output "management_locks_scope" {
  description = "Map of scope values across all management_locks, keyed the same as var.management_locks"
  value       = { for k, v in azurerm_management_lock.management_locks : k => v.scope if v.scope != null && length(v.scope) > 0 }
}

