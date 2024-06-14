require('dotenv').config()
const {prisma} = require('../config/db')

async function handelUserRegister(req, res){
    const { name, number, email, password } = req.body;

    try {
        const user = await prisma.User.create({
            data:{
                name: name,
                email: email,
                number: number,
                password: password,
            }
        })

        res.status(201).json(user);
    } catch (error) {
        console.error(error);
        return res.status(500).json({ error: "Failed to insert user"});
    }

}

module.exports = handelUserRegister