const post = require("../models/PostModel")
const AppController = {};

AppController.getPosts = ( req, res ) => {
  post.getAll ((data) => {
    res.status(200).json(data);
  });
}

AppController.getOwnPosts = ( req, res ) => {
  console.log(req.params.id)
  post.getOwnPosts (req.params,(data) => {
    res.status(200).json(data);
  });
}

AppController.newPost = ( req, res ) => {
    post.newPost(req.body,(data) => {
        if (data.status=='Ok') {
            res.status(201).json(data);
          }else{
            res.status(500).json(data)
          }
      });
}

AppController.updatePost = ( req, res ) => {
    const params={
        id:req.params.id,
        data:req.body
      }
    post.updatePost(params,(data) => {
        if (data.status=='Ok') {
            res.status(201).json(data);
          }else{
            res.status(500).json(data)
          }
      });
}

AppController.deletePost = ( req, res ) => {
    const params=req.params.id;

    post.deletePost(params,(data)=>{
    if (data.status=='Ok') {
      res.status(201).json(data);
    }else{
      res.status(500).json(data)
    }
  })
}

AppController.getComments = ( req, res ) => {
    const { idArticle } = req.params;

    post.getComments (idArticle,(data) => {
    if (data.status=='Ok') {
        res.status(201).json(data);
    }else{
        res.status(500).json(data)
    }
    });
}

AppController.newComment = ( req, res ) => {
  post.newComment(req.body,(data) => {
      if (data.status=='Ok') {
          res.status(201).json(data);
        }else{
          res.status(500).json(data)
        }
    });
}

module.exports = AppController;