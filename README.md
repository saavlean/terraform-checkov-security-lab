# 🛡️ Checkov IaC Security Lab

Este laboratorio demuestra cómo aplicar escaneo de seguridad automatizado a infraestructura como código (IaC) usando [Checkov](https://www.checkov.io/), una herramienta gratuita y open source desarrollada por Bridgecrew (Prisma Cloud). El objetivo es enseñar cómo detectar y corregir errores de configuración en Terraform antes de desplegar, integrando seguridad desde el código.

## ✅ ¿Por qué usar Checkov?

Checkov permite detectar vulnerabilidades, malas prácticas y configuraciones inseguras en archivos Terraform, CloudFormation, Kubernetes y más. Es ideal para entornos DevOps, CI/CD y enseñanza de seguridad desde el diseño.

| Ventaja | Descripción |
|--------|-------------|
| 🆓 Gratuito | Sin costo para uso local y en CI/CD |
| 🔍 Escaneo profundo | Más de 1000 checks actualizados |
| 🧠 Ideal para enseñanza | Detecta errores reales y permite corregirlos paso a paso |
| ☁️ Compatible con cloud y on-premises | AWS, Azure, GCP, y entornos locales |
| 🔄 Integración CI/CD | Bloquea despliegues inseguros automáticamente |

## ☁️ ¿Dónde aplicarlo?

| Entorno | Aplicabilidad | Beneficio |
|--------|---------------|-----------|
| Cloud (AWS, Azure, GCP) | ✅ Alta | Prevención de errores antes del despliegue |
| On-Premises | ✅ Media | Validación de IaC antes de aplicar cambios |
| CI/CD | ✅ Total | Bloquea despliegues inseguros automáticamente |
| Local (WSL, VSCode) | ✅ Alta | Escaneo rápido antes de hacer commit |

## 🧪 Procedimiento del laboratorio

1. Alterna entre versiones vulnerable y segura con:

   ```bash
   ./scripts/switch.sh vulnerable
   ./scripts/switch.sh secure
   ```

2. Haz commit y push al branch `main` para activar GitHub Actions.  
3. El workflow ejecuta Checkov y escanea `terraform/main.tf`.  
4. Si hay errores, el workflow falla (rojo ❌).  
5. Corrige y repite → enseñanza iterativa y validación real.

## 📂 Estructura del repositorio

```
terraform-checkov-security-lab/
├── terraform/
│   ├── main.tf                # Archivo activo (vulnerable o seguro)
│   ├── main.vulnerable.tf     # Versión insegura para escaneo
│   ├── main.secure.tf         # Versión corregida y validada
├── scripts/
│   └── switch.sh              # Script para alternar entre versiones
├── .github/
│   └── workflows/
│       └── ci.yml             # Workflow de GitHub Actions con Checkov
├── README.md                  # Documentación del laboratorio
```

## 📊 Comparación entre versiones

| Aspecto                          | `main.vulnerable.tf` | `main.secure.tf` |
|----------------------------------|-----------------------|------------------|
| ACL pública                      | ❌ `"public-read"`    | ✅ `"private"`   |
| Cifrado                          | ❌ No hay             | ✅ `aws:kms`     |
| Versionado                       | ❌ Ausente            | ✅ `enabled = true` |
| Logging                          | ❌ Ausente            | ✅ `target_bucket` configurado |
| Replicación                      | ❌ No aplica          | ✅ `replication_configuration` |
| Bloqueo de acceso público        | ❌ No hay             | ✅ `aws_s3_bucket_public_access_block` |
| Notificaciones de eventos (SNS) | ❌ No hay             | ✅ `aws_s3_bucket_notification` |
| Cifrado SNS                      | ❌ No aplica          | ✅ `kms_master_key_id = "alias/aws/sns"` |
| Resultado Checkov                | ❌ 10+ errores        | ✅ 0 errores     |

## 🧠 Observaciones clave

- El escaneo se realiza con `checkov -f terraform/main.tf` para evitar analizar archivos auxiliares como `main.vulnerable.tf`.
- El workflow de GitHub Actions está configurado para fallar si Checkov detecta errores, lo cual es útil para bloquear despliegues inseguros.
- Puedes modificar el paso final del workflow con `|| true` si deseas que el pipeline no falle (solo para demostración).

## 📌 Recomendación final

Este laboratorio es aplicable tanto en entornos educativos como profesionales. Implementar Checkov en tus pipelines permite:

- **Prevenir errores antes del despliegue**
- **Asegurar cumplimiento de políticas**
- **Enseñar seguridad desde el código**
- **Automatizar validaciones en CI/CD**
- **Reducir riesgos en entornos cloud y on-premises**

## 📎 Recursos adicionales

- [Documentación oficial de Checkov](https://www.checkov.io/)
- [Políticas de Prisma Cloud](https://docs.prismacloud.io/)
- [Repositorio oficial de Bridgecrew](https://github.com/bridgecrewio/checkov)

## 🔐 Sobre el archivo `.gitignore`

Este repositorio incluye un `.gitignore` reforzado para evitar subir archivos sensibles, temporales o irrelevantes que puedan comprometer la seguridad o la reputación del proyecto. Está alineado con buenas prácticas DevSecOps y cubre:

- Archivos `.env`, claves, certificados, backups
- Artefactos de escaneo como `.log`, `.json`, `.html`
- Directorios `.terraform/`, `__pycache__/`, `.idea/`, `.vscode/`
- Archivos de herramientas como `*.tfplan`, `*.auto.tfvars`, `checkov_results.*`

Este enfoque demuestra una postura proactiva en seguridad y modela buenas prácticas para tus seguidores.

## 🌐 Conecta conmigo

Aprende más sobre DevOps, IaC y seguridad en mis redes:

- [LinkedIn](https://www.linkedin.com/in/josegaragorry)  
- [TikTok](https://www.tiktok.com/@josegaragorry)  
- [YouTube](https://www.youtube.com/@josegaragorry)

> 🎓 Este laboratorio fue diseñado para enseñar seguridad en IaC de forma práctica, reproducible y alineada con buenas prácticas DevSecOps. Ideal para formadores, estudiantes, y profesionales que buscan integrar seguridad desde el diseño.

