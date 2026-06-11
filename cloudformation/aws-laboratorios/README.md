# Laboratorios Endpoint Central en AWS (CloudFormation)

Equivalente a `terraform/aws-laboratorios/`: **una VPC** y **N laboratorios** mediante el módulo `templates/lab.yaml` (stack anidado por lab).

Cada lab incluye:

| Recurso | Red |
|---------|-----|
| `ec-server` | IP privada `.10`, IP pública (RDP + consola EC `:8020`) |
| `ec-client1` | `.11` + pública |
| `ec-client2` | `.12` + pública |

Subred por lab: `10.0.<index>.0/24`.

## Aislamiento

| Capa | Comportamiento |
|------|----------------|
| **Subred + route table** | Una RT por lab → salida a Internet vía IGW |
| **NACL** | Deniega tráfico hacia/desde el resto del CIDR de la VPC (otros labs) |
| **Security group** | Un SG por lab: todo el tráfico entre instancias del mismo SG + desde Internet: RDP `3389` y puertos EC `8020`, `8383`, `8027`, `8443` (TCP/UDP), `8444` |

## Estructura

```
cloudformation/aws-laboratorios/
├── root.yaml              # VPC + IGW + Fn::ForEach de stacks anidados
├── templates/lab.yaml     # Módulo: subred, NACL, SG, 3 EC2
└── parameters/example.json
```

## Despliegue

Los stacks anidados requieren subir `lab.yaml` a S3 (`aws cloudformation package`).

```bash
cd cloudformation/aws-laboratorios

# 1. Empaquetar (sube lab.yaml a S3 y genera root empaquetado)
aws cloudformation package \
  --template-file root.yaml \
  --s3-bucket MI-BUCKET-CF \
  --s3-prefix endpoint-central/labs \
  --output-template-file packaged-root.yaml

# 2. Editar parámetros
cp parameters/example.json parameters/mi-cuenta.json
# AMIs, key_name, LabTemplateUrl (la URL S3 que generó package)

# 3. Crear o actualizar stack
aws cloudformation deploy \
  --template-file packaged-root.yaml \
  --stack-name endpoint-central-labs \
  --parameter-overrides \
    KeyName=mi-keypair-lab \
    AmiServer=ami-xxxxxxxxxxxxxxxxx \
    AmiClient=ami-yyyyyyyyyyyyyyyyy \
    LabIndexes=1,2,10 \
    LabTemplateUrl=https://MI-BUCKET.s3.eu-west-1.amazonaws.com/endpoint-central/labs/xxxxxxxx.lab.yaml \
  --capabilities CAPABILITY_IAM \
  --region eu-west-1

# Alternativa con fichero de parámetros (create-stack / update-stack):
# aws cloudformation create-stack --template-body file://packaged-root.yaml \
#   --stack-name endpoint-central-labs --parameters file://parameters/example.json \
#   --capabilities CAPABILITY_IAM --region eu-west-1

# 4. Ver salidas por lab
aws cloudformation describe-stacks \
  --stack-name endpoint-central-labs \
  --query 'Stacks[0].Outputs' \
  --output table
```

## Añadir un lab

1. Añade el índice a `LabIndexes` (ej. `1,2,3,10`).
2. Añade el nombre en el mapping `LabNamesByIndex` de `root.yaml`:

```yaml
Mappings:
  LabNamesByIndex:
    "3":
      Name: lab-03
```

3. `aws cloudformation package` + `deploy` de nuevo.

También puedes desplegar **un solo lab** sin el root:

```bash
aws cloudformation deploy \
  --template-file templates/lab.yaml \
  --stack-name ec-lab-03 \
  --parameter-overrides \
    LabName=lab-03 LabIndex=3 \
    VpcId=vpc-xxxx InternetGatewayId=igw-xxxx \
    VpcCidr=10.0.0.0/16 \
    AmiServer=ami-xxx AmiClient=ami-yyy KeyName=mi-key \
  --region eu-west-1
```

## Requisitos previos AWS

- Key pair EC2 (descifrar contraseña Administrator de Windows)
- AMIs Windows con licencia en la región
- Cuota de instancias suficiente (3 × N labs)
- Bucket S3 para templates anidados
- Instalar Endpoint Central en `ec-server` tras el primer arranque (no incluido en CF)

## Destruir

```bash
aws cloudformation delete-stack --stack-name endpoint-central-labs
```
