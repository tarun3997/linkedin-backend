require("dotenv").config();
const jwt = require("jsonwebtoken");
const { prisma } = require("../config/db");
const bcrypt = require("bcryptjs");

async function handelUserRegister(req, res) {
  const { name, number, email, password } = req.body;

  const salt = await bcrypt.genSalt(10);
  const hashPassword = await bcrypt.hash(password, salt);
  try {
    const user = await prisma.User.create({
      data: {
        name: name,
        email: email,
        number: number,
        password: hashPassword,
      },
    });

    res.status(201).json(user);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Failed to insert user" });
  }
}

async function handelUserLogin(req, res) {
  const { email, password } = req.body;

  try {
    const user = await prisma.user.findUnique({
      where: {
        email: email,
      },
    });
    if (!user) {
      return res.status(404).send({ message: "User not found" });
    }
    if (!(await bcrypt.compare(password, user.password))) {
      return res.status(400).send({ message: "Invalid credentials" });
    }

    const token = jwt.sign({ id: user.id }, process.env.ACCESS_TOKEN_SECRET);
    res.cookie("jwt", token, {
      httpOnly: true,
      maxAge: 24 * 60 * 60 * 1000,

      });
    return res.send({message: 'login success',token});
  } catch (error) {
    return res.status(500).json({ error: "Failed to login" });

  }
}

module.exports = {handelUserRegister, handelUserLogin};
