# Laboratorios Endpoint Central en AWS (Terraform)

Una **VPC compartida** y **N laboratorios** instanciados con el módulo `modules/lab`.

Cada lab tiene:

| Recurso | Red |
|---------|-----|
| `ec-server` | IP privada `.10`, IP pública (RDP + consola EC `:8020`) |
| `ec-client1` | `.11` + pública |
| `ec-client2` | `.12` + pública |

Subred por lab: `10.0.<index>.0/24` (variable `labs.<nombre>.index`).

## Aislamiento

| Capa | Comportamiento |
|------|----------------|
| **Subred + route table** | Una RT por lab → salida a Internet vía IGW |
| **NACL** | Deniega tráfico hacia/desde el resto del CIDR de la VPC (otros labs) |
| **Security group** | Un SG por lab: **todo** el tráfico entre instancias del mismo SG + RDP `:3389` desde `0.0.0.0/0` |

## Uso

```bash
cd terraform/aws-laboratorios
cp terraform.tfvars.example terraform.tfvars
# Edita AMIs, key_name y labs

terraform init
terraform plan
terraform apply
```

Salida:

```bash
terraform output labs
```

## Añadir un lab

En `terraform.tfvars`:

```hcl
labs = {
  "lab-03" = { index = 3 }
}
```

`terraform apply` crea subred `10.0.3.0/24` + 3 instancias.

## Requisitos previos AWS

- Key pair EC2 (descifrar contraseña Administrator de Windows)
- AMIs Windows con licencia en la región
- Cuota de instancias suficiente (3 × N labs)
- Instalar Endpoint Central en `ec-server` tras el primer arranque (no incluido en Terraform)

## Coste

Apagar o destruir cuando no se use:

```bash
terraform destroy
```
