const express = require('express');
const dotenv = require('dotenv');
const usersRoutes = require('./routes/users.routes');

dotenv.config();
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Ruta principal
app.get('/', (req, res) => {
  res.send('API is running 🚀');
});

// Ruta de test
app.get('/ping', (req, res) => {
  res.status(200).json({ message: 'pong' });
});

// Montar rutas de usuarios
app.use('/users', usersRoutes); 

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

module.exports = app;
