# 🛡️ Checkov IaC Security Workshop — Escaneo de Infraestructura como Código para DevSecOps

Este workshop te enseña a escanear archivos Terraform con [Checkov](https://www.checkov.io/) para detectar vulnerabilidades, configuraciones inseguras y malas prácticas en tu infraestructura como código (IaC). Es ideal para DevOps, DevSecOps, SREs, SysOps, Cloud Engineers y educadores técnicos que quieren enseñar seguridad desde el diseño.

---

## 🎯 Objetivos del workshop

- Aprender a instalar y usar Checkov localmente
- Detectar vulnerabilidades reales en archivos Terraform
- Corregir configuraciones inseguras paso a paso
- Integrar escaneo automático en pipelines CI/CD con GitHub Actions
- Promover buenas prácticas DevSecOps desde el código

---

## 🧠 ¿Por qué es importante este workshop?

La seguridad en la nube comienza en el código. Cada recurso mal configurado puede abrir puertas a vulnerabilidades críticas. Este workshop te permite:

- Detectar errores antes de desplegar
- Validar IaC como parte del ciclo DevOps
- Enseñar buenas prácticas con ejemplos reales
- Automatizar escaneo en CI/CD

---

## 🧪 Requisitos técnicos

Este proyecto está diseñado para ejecutarse **localmente en tu entorno WSL (Windows Subsystem for Linux)** o cualquier sistema Linux compatible.

### Requisitos mínimos:

- Python 3.8+
- Terraform CLI
- Git
- Checkov (instalado con `pipx` o entorno virtual)

---

## ⚙️ Instalación de Checkov

### ✅ Opción 1: Usar entorno virtual (recomendado para workshops)

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install checkov
```

### ✅ Opción 2: Usar `pipx` (recomendado para herramientas CLI)

```bash
sudo apt install pipx
pipx ensurepath
pipx install checkov
source ~/.bashrc  # o reinicia tu terminal
```

Verifica que Checkov esté disponible:

```bash
which checkov
```

---

## 📁 Estructura del proyecto

```plaintext
checkov-iac-security-workshop/
├── terraform/              # Archivos vulnerables y corregidos
│   ├── main.vulnerable.tf  # Versión con errores reales
│   ├── main.secure.tf      # Versión corregida que pasa todos los checks
│   └── main.tf             # Archivo activo que se intercambia
├── scripts/                # Scripts de escaneo y alternancia
│   ├── scan.sh             # Escaneo local con Checkov
│   └── switch.sh           # Alternar entre vulnerable y seguro
├── .github/workflows/      # CI/CD con GitHub Actions
│   └── ci.yml
├── .gitignore              # Exclusión de archivos innecesarios
├── README.md               # Descripción general del proyecto
├── README-guía.md          # Este archivo
├── LICENSE                 # MIT License
```

---

## 🚀 Ejecución local paso a paso

```bash
# 1. Clona el repositorio
git clone https://github.com/jgaragorry/checkov-iac-security-workshop.git
cd checkov-iac-security-workshop

# 2. Instala Checkov (ver sección anterior)

# 3. Ejecuta el escaneo local
./scripts/scan.sh
```

---

## 📊 Resultados esperados del escaneo

Al ejecutar:

```bash
checkov -d terraform/
```

Verás una salida como esta:

- ✅ 3 checks PASSED
- ❌ 8 checks FAILED

Errores detectados incluyen:

- Falta de cifrado con KMS
- ACL pública en el bucket
- Falta de versionado
- Falta de logging
- Falta de bloqueo de acceso público

Cada uno representa una oportunidad de aprendizaje. Puedes corregirlos en `main.tf`, volver a escanear y validar que el código cumple con las políticas de seguridad.

---

## 🔄 Alternar entre versiones vulnerable y segura

Este workshop incluye dos versiones del archivo `main.tf` para enseñar el antes y después del escaneo con Checkov:

- `main.vulnerable.tf` → contiene errores reales para escanear y explicar
- `main.secure.tf` → versión corregida que pasa todos los checks

Puedes alternar entre ambas usando el script:

```bash
# Activar versión vulnerable
./scripts/switch.sh vulnerable
checkov -d terraform/

# Activar versión segura
./scripts/switch.sh secure
checkov -d terraform/
```

Esto te permite mostrar cómo Checkov detecta errores, cómo corregirlos, y cómo validar que el código cumple con las políticas de seguridad.

---

## ⚙️ Activación de CI/CD (opcional)

Cada vez que hagas `git push` al branch `main`, se activará el workflow de GitHub Actions que escanea automáticamente los archivos Terraform con Checkov.

```bash
git add .
git commit -m "Activando Checkov CI/CD"
git push origin main
```

---

## 📲 Comunidad y redes

Únete a la comunidad para seguir aprendiendo, compartir tus avances y recibir apoyo técnico:

- 🔗 TikTok: [@softtraincorp](https://www.tiktok.com/@softtraincorp)
- 🔗 LinkedIn: [Jose Garagorry](https://www.linkedin.com/in/jgaragorry/)
- 🔗 WhatsApp (grupo de estudio): [Únete aquí](https://chat.whatsapp.com/ENuRMnZ38fv1pk0mHlSixa)

---

Este workshop forma parte de una serie de laboratorios técnicos diseñados para enseñar buenas prácticas en DevOps, DevSecOps, SRE, SysOps, NetOps, Observabilidad y FinOps. Cada paso está validado, documentado y pensado para ser reproducible y enseñable.

¡Prepárate para escanear tu infraestructura como un verdadero Ninja DevSecOps! 🥷

