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
        v.notes == null || (length(v.notes) >= 0 && length(v.notes) <= 512)
      )
    ])
    error_message = "must be between 0 and 512 characters"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_management_lock's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.ManagementLockName] !regexp.MustCompile(`[A-Za-z0-9-_]`).MatchString(input)
  # path: name
  #   condition: length(value) < 260
  #   message:   [from validate.ManagementLockName: invalid when len(value) >= 260]
  #   source:    [from validate.ManagementLockName: invalid when len(value) >= 260]
  # path: lock_level
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

