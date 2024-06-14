const handelUserRegister = require('../controllers/handelUserAuth');

const router = require('express').Router()

router.post('/login', handelUserRegister)

module.exports = router;