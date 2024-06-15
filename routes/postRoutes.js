const multer = require('multer');
const { handelAddPost } = require('../controllers/userPostController');
const router = require('express').Router()

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './postImages'); 
    },
    filename: function (req, file, cb) {
        cb(null, Date.now() + '-' + file.originalname); // Unique file name
    }
});

const upload = multer({ storage: storage });


router.post('/addpost',upload.single("imageUrl"), handelAddPost)

module.exports = router;