variable "management_locks" {
  description = <<EOT
Map of management_locks, attributes below
Required:
    - lock_level
    - name
    - scope
Optional:
    - notes
EOT

  type = map(object({
    lock_level = string
    name       = string
    scope      = string
    notes      = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.management_locks : (
        length(v.name) < 260
      )
    ])
    error_message = "[from validate.ManagementLockName: invalid when len(value) >= 260]"
  }
  validation {
    condition = alltrue([
      for k, v in var.management_locks : (
        v.notes == null || (length(v.notes) >= 0 && length(v.notes) <= 512)
      )
    ])
    error_message = "must be between 0 and 512 characters"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

