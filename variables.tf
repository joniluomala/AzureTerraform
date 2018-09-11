variable azure_subscription_id {
  type="string"
}
variable azure_client_id {
  type="string"
}
variable azure_client_secret {
  type="string"
}
variable azure_tenant_id {
  type="string"
}

variable "tags" {
  type="map"
  default={
    billTo = "Joni"
    managegBy = "Joni"
    project-name = "DataHub"
    project-version = 1.0
    environment= "Development"
    tier="Data"
    dataProfile="Internal"
  }
}

variable "rg"{
  type="string"
  default="terraform-testgroup"
}

variable "location"{
  type="string"
  default="North Europe"
}

variable "sql_admin"{
  type="string"
}
variable "sql_password" {
  type="string"
}
