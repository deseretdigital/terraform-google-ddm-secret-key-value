# Google Secrets Manager Module

This module was built with the explicit goal of adding a key/value pair to Google Secrets Manager and then allowing a Cloud Run/Compute instance access to the secret. There is potential that it could be used in other way, but at this point the scope is very narrow. 

It is a best practice to handle everything as a secret throughout this process so no CI/CD process exposes the values. That is handled as much as it can be on this end, but the inputs need to be sanitized as well. 

## Usage 

```hcl
module "ddm-secret-key-value" {
  source  = "deseretdigital/ddm-secret-key-value/google"
  version = "1.0.0"
  # insert the 3 required variables here
}
```

## Variables

| Name | Description | Example | Default |
| ----- | ----- | ----- | ----- |
| `service_account` | The service account that will need access to the key. In the case of compute instances, it will look like {numbers}-compute@developer.gserviceaccount.com | `{NUMBERS}-compute@developer.gserviceaccount.com` | *none* |
| `secret_key` | The key for the secret. | "treasure-location" | *none* |
| `secret_value` | The value for the secret. | "treasure map directions" | *none* |

## Outputs

*none*