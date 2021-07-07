const db = require("../database")
const PostModel = {}

PostModel.getAll = (callback) => {
    db.raw(`SELECT User.username, Article.id, title, created_at, Article.image_url, User.image_url as profilePicture  FROM Article
    left join User on User.id = Article.id_user
    order by created_at desc
    `)
      .then( (data) => { 
        callback({
          status: "Ok",
          data:data[0]
        })
       })
      .catch((error) => {
        callback({
          status: "error",
          message: 'Ha ocurrido un error',
          error
        })
      })
  }

PostModel.getComments = (idArticle,callback) => {
    db.raw(`select comment.id,user.username, comment.content, comment.created_at, comment.id_article from article
    join comment on article.id = comment.id_article
    join user on comment.id_userBelongs = user.id
    where comment.id_article = ${idArticle} 
    order by comment.created_at desc`)
      .then( (data) => { 
        callback({
          status: "Ok",
          data:data[0]
        })
       })
      .catch((error) => {
        callback({
          status: "error",
          message: 'Ha ocurrido un error',
          error
        })
      })
  }

  PostModel.newPost = ({title, details, image_url, id_user},callback) => {
    db('article').insert({title, details, image_url, id_user})
     .then((data)=>{
       callback({
         status: "Ok",
         message:"Articulo añadido correctamente",
         data
       })
     })
     .catch((error)=>{
       callback({
         status: "error",
         message: 'Ha ocurrido un error en el servidor',
         error:error.sqlMessage
       })
     }) 
  }


  PostModel.updatePost= ({id,data},callback) => {
    db.table('article')
    .where('id','=',id)
    .update({title:data.title, details:data.details,image_url:data.image_url,})
    .then((data)=>{
      callback({
        status: "Ok",
        message:"El post fue actualizado correctamente",
        data
      })
    })
    .catch((error)=>{
      callback({
        status: "error",
        message: 'Ha ocurrido un error en el servidor',
        error
      })
    }) 
  }

  PostModel.deletePost= (params,callback) => {
    db.table('article')
    .where('id','=',params)
    .del()
    .then((data)=>{
      if (data!=0) {
        callback({
          status: "Ok",
          message:"Post eliminado correctamente",
          data: data
        })
      }else{
  
        callback({
          status: "error",
          message:"Este post no se encuentra registrado",
          data: data
        })
      }
      
    })
    .catch((error)=>{
    
      callback({
        status: "error",
        message: 'Ha ocurrido un error en el servidor',
        error: error
      })
    }) 
  
  }

  PostModel.newComment = ({ content, id_userBelongs, id_article },callback) => {
    db('comment').insert({ content, id_userBelongs, id_article })
     .then((data)=>{
       callback({
         status: "Ok",
         message:"Comentario añadido correctamente",
         data
       })
     })
     .catch((error)=>{
       callback({
         status: "error",
         message: 'Ha ocurrido un error en el servidor',
         error:error.sqlMessage
       })
     }) 
  }

  PostModel.getOwnPosts = ({id},callback) => {
    db.raw(`SELECT User.username, Article.id, title, created_at, Article.image_url, User.image_url as profilePicture  FROM Article
    left join User on User.id = Article.id_user
    where Article.id_user = ${id}
    order by created_at desc
    `)
      .then( (data) => { 
        callback({
          status: "Ok",
          data:data[0]
        })
       })
      .catch((error) => {
        callback({
          status: "error",
          message: 'Ha ocurrido un error',
          error
        })
      })
  }

module.exports = PostModel;
