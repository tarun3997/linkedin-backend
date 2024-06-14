const cookieParser = require('cookie-parser')
const express = require('express')

const app = express()
app.use(cookieParser())
app.use(express.urlencoded({extended: false}));                                                             
app.use(express.json())

app.use('/api', require('./routes/authRoutes'))

app.listen(4000, ()=> console.log("Server started"))