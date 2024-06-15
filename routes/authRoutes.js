const {handelUserRegister, handelUserLogin} = require('../controllers/userAuthController');

const router = require('express').Router()

router.post('/signup', handelUserRegister)
router.post('/login', handelUserLogin)

module.exports = router;