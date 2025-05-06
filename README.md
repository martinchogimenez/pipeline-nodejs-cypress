
# 🚀 Proyecto Node.js + Cypress + GitHub Actions + AWS

Este proyecto es una API simple en Node.js con pruebas end-to-end usando Cypress, e integración continua con despliegue automático a una instancia EC2 de AWS.

---

## 🛠️ Pasos para levantar el proyecto de cero

### 🔁 1. Clonar el repositorio

```bash
git clone https://github.com/martinchogimenez/pipeline-nodejs-cypress.git
cd pipeline-nodejs-cypress
```

### 📦 2. Instalar dependencias

```bash
npm install
```

### ⚙️ 3. Crear el archivo `.env`

```bash
touch .env
```

Y agregar:

```env
PORT=3000
```

### 🚀 4. Correr la app localmente

```bash
npm run dev
```

Visitar: [http://localhost:3000](http://localhost:3000)

### 🧪 5. Correr los tests de Cypress

```bash
npx cypress run
```

> Asegurate de que la app esté corriendo antes.

### 🧼 6. Estructura esperada del proyecto

```
pipeline-nodejs-cypress/
├── .env
├── app.js
├── package.json
├── package-lock.json
├── README.md
├── cypress/
│   └── e2e/
│       └── users.cy.js
├── cypress.config.js
├── controllers/
│   └── users.controller.js
├── routes/
│   └── users.routes.js
├── .github/
│   └── workflows/
│       └── deploy.yml
```


### 🤖 7. Desplegar automáticamente a EC2

Una vez tengas la EC2 creada y funcionando, y los secretos configurados correctamente:

```bash
git add .
git commit -m "primer deploy"
git push origin main
```

Esto disparará el pipeline que:

- Instala dependencias
- Corre los tests con Cypress
- Se conecta por SSH a la EC2
- Actualiza el repo
- Instala dependencias
- Ejecuta con PM2

---

## 📄 Licencia

MIT