<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.31.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_Compute"></a> [Compute](#module\_Compute) | ./Compute | n/a |
| <a name="module_Network"></a> [Network](#module\_Network) | ./Network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | n/a | `list` | <pre>[<br>  "us-east-2a",<br>  "us-east-2b",<br>  "us-east-2c"<br>]</pre> | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | n/a | `list` | <pre>[<br>  "Avsha_inst1",<br>  "Avsha_inst2"<br>]</pre> | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | naming prefix | `string` | n/a | yes |
| <a name="input_public_subnet_cidrs"></a> [public\_subnet\_cidrs](#input\_public\_subnet\_cidrs) | n/a | `list` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24"<br>]</pre> | no |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Enter a name for youre ssh key | `string` | `""` | no |
| <a name="input_ssh_key_public"></a> [ssh\_key\_public](#input\_ssh\_key\_public) | Paste public key here | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->