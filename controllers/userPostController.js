const { prisma } = require("../config/db")

async function handelAddPost(req, res){
    const { postTitle} = req.body
    const imagePaths = req.file.filename;

    try {

        const post = await prisma.post.create({
            data:{
                postImg: imagePaths,
                postTitle,
                userId: "3ab87577-c3fe-489d-a88e-239c67eb2d19"
            }
        })
        console.log(post);
        res.status(201).json(post);
    } catch (error) {
        console.log(error)
        return res.send({message: 'Post not uploaded'});
    }
}

module.exports = {handelAddPost}