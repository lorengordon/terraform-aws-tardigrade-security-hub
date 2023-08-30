variable "auto_enable_controls" {
  description = "Boolean that enables the security standards that Security Hub has designated as automatically enabled including: `AWS Foundational Security Best Practices v1.0.0` and `CIS AWS Foundations Benchmark v1.2.0`"
  type        = bool
  default     = true
}

variable "control_finding_generator" {
  description = "Manages whether the account reports consolidated control findings, or generates separate findings for every enabled standard."
  type        = string
  default     = null

  validation {
    condition = (
      var.control_finding_generator != null ?
      contains(["SECURITY_CONTROL", "STANDARDS_CONTROL"], var.control_finding_generator) :
      true
    )
    error_message = "control_finding_generator must be one of: SECURITY_CONTROL, STANDARDS_CONTROL, null"
  }
}

variable "enable_default_standards" {
  description = "Boolean that automatically enables new controls when they are added to standards that are enabled"
  type        = bool
  default     = true
}
