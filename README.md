
# 🚀 Proyecto Node.js + Cypress + GitHub Actions + AWS + Terraform

Este proyecto implementa una API sencilla en **Node.js** con pruebas end-to-end usando **Cypress**, integración continua mediante **GitHub Actions** para despliegue automático a una instancia EC2 de **AWS**, y despliegue de infraestructura como código utilizando **Terraform**.

---

## 🛠️ Pasos para levantar el proyecto desde cero

### 🔁 1. Clonar el repositorio

Primero, clona el repositorio y accede al directorio del proyecto:

```bash
git clone https://github.com/martinchogimenez/pipeline-nodejs-cypress.git
cd pipeline-nodejs-cypress
```

### 📦 2. Instalar dependencias

Instala las dependencias necesarias para la API y Cypress:

```bash
npm install
```

### ⚙️ 3. Crear el archivo `.env`

Este archivo es necesario para configurar las variables de entorno. Crea el archivo `.env` en la raíz del proyecto:

```bash
touch .env
```

Agrega el siguiente contenido:

```env
PORT=3000
```

### 🚀 4. Correr la app localmente

Una vez instaladas las dependencias y configurado el archivo `.env`, puedes correr la aplicación localmente:

```bash
npm run dev
```

Visita: [http://localhost:3000](http://localhost:3000)

### 🧪 5. Correr los tests de Cypress

Antes de correr los tests, asegúrate de que la aplicación esté corriendo. Luego, ejecuta los tests de Cypress para asegurarte de que todo funcione correctamente:

```bash
npx cypress run
```

### 🧼 6. Estructura esperada del proyecto

La estructura de archivos y carpetas del proyecto debería ser la siguiente:

```
pipeline-nodejs-cypress/
├── .env                    # Archivo de configuración de entorno
├── app.js                  # Archivo principal de la API
├── package.json            # Dependencias del proyecto
├── package-lock.json       # Lockfile de las dependencias
├── README.md               # Este archivo
├── cypress/
│   └── e2e/
│       └── users.cy.js     # Test de Cypress
├── cypress.config.js       # Configuración de Cypress
├── controllers/
│   └── users.controller.js # Lógica de los controladores
├── routes/
│   └── users.routes.js     # Definición de rutas
├── .github/
│   └── workflows/
│       └── deploy.yml      # Workflow de GitHub Actions
├── infrastructure/
│   └── main.tf             # Infraestructura con Terraform
```

### 🤖 7. Desplegar automáticamente a EC2

Cuando tengas la instancia EC2 configurada correctamente, con los secretos de GitHub Actions configurados, puedes hacer un `git push` para disparar el pipeline:

```bash
git add .
git commit -m "primer deploy"
git push origin main
```

Este pipeline realizará las siguientes acciones:

- Instalará las dependencias en la instancia EC2.
- Ejecutará los tests de Cypress.
- Se conectará por SSH a la instancia EC2.
- Clonará el repositorio en la EC2 y actualizará el código.
- Instalará las dependencias en la EC2.
- Ejecutará la app usando **PM2** para mantenerla en ejecución.

**Nota**: Asegúrate de tener configurados correctamente los secretos en GitHub para que el acceso a la EC2 se realice de manera segura.

### 🌍 8. Despliegue de infraestructura con Terraform

Este proyecto también incluye la configuración de la infraestructura utilizando **Terraform**. Para desplegar la infraestructura, sigue estos pasos:

1. Asegúrate de tener **Terraform** instalado en tu máquina. Puedes seguir las instrucciones de instalación en [Terraform Docs](https://www.terraform.io/downloads.html).
2. Navega al directorio `infrastructure` y ejecuta los siguientes comandos:

```bash
cd infrastructure
terraform init  # Inicializa Terraform
terraform apply # Aplica los cambios de la infraestructura
```

Esto creará la infraestructura necesaria en AWS, como la instancia EC2, grupos de seguridad, etc.
---

## 📄 Licencia

Este proyecto está bajo la licencia **MIT**. 

---