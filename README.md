# Despliegue de infraestructura Multicapa con Terraform y Docker

Este proyecto despliega una arquitectura web de 3 capas (Frontend, Backend y Base de Datos) en contenedores Docker, orquestados con Terraform.

## ARQUITECTURA
- **Frotend:** Nginx (2 replicas) en red `red_front`
- **Backend:** Node.js (2 réplicas) en red `red_front` y `red_back`
- **Base de Datos:** PostgreSQL (1 réplica) en red `red_back`

## GUIA DE DESPLIEGUE PASO A PASO
### 1. Entrar al directorio de infraestructura e inicializar
```bash
cd iac
terraform init
```
### 2. Desplegar en el entorno de Desarrollo (dev)

#### -*Crear y seleccionar el workspace dev*
```bash
terraform workspace new dev
```
#### -*Desplegar los recursos*
```bash
terraform apply -auto-approve
```
### 3. Desplegar en el entorno de Control de Calidad (qa)

#### -*Crear y seleccionar el workspace qa*
```bash
terraform workspace new qa
```

#### -*Desplegar los recursos*
```bash
terraform apply -auto-approve
```

### 4. Verificación de Contenedores

```bash
docker ps
```

## Eliminacion de Arquitectura

#### -*Eliminar entorno DEV*
```bash
terraform workspace select dev
```
```bash
terraform destroy -auto-approve
```

#### -*Eliminar entorno QA*
```bash
terraform workspace select qa
```
```bash
terraform destroy -auto-approve
```

