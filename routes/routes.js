const { Router } = require("express");
const router = Router();
const AppController = require("../controllers/AppController");

router.get("/getPosts",AppController.getPosts);

router.get("/getOwnPosts/:id",AppController.getOwnPosts);

router.post("/newPost",AppController.newPost);

router.put("/updatePost/:id",AppController.updatePost);

router.delete("/deletePost/:id",AppController.deletePost);

router.get("/getComments/:idArticle",AppController.getComments);

router.post("/newComment",AppController.newComment);

module.exports = router;
