const express = require('express');
const dotenv = require('dotenv');

dotenv.config();
const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Nueva ruta para /
app.get('/', (req, res) => {
  res.send('API is running 🚀');
});

app.get('/ping', (req, res) => {
  res.status(200).json({ message: 'pong' });
});

const users = [];

app.get('/users', (req, res) => {
  res.status(200).json(users);
});

app.post('/users', (req, res) => {
  const user = req.body;
  if (!user.name) return res.status(400).json({ error: 'Name is required' });
  users.push(user);
  res.status(201).json(user);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
