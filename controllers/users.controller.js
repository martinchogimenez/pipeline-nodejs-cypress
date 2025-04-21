// controllers/users.controller.js
const users = [];

const getUsers = (req, res) => {
  res.status(200).json(users);
};

const createUser = (req, res) => {
  const user = req.body;
  if (!user.name) {
    return res.status(400).json({ error: 'Name is required' });
  }
  users.push(user);
  res.status(201).json(user);
};

module.exports = { getUsers, createUser };
