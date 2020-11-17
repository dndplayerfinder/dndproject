const express = require("express");
const router = express.Router();
const homeController = require("../controllers/home");
const uploadController = require("../controllers/upload");
const upload = require("../middleware/upload");

/*let routes = (app) => {
  router.get("/upload", homeController.getHome);

  router.post("/upload", upload.single("file"), uploadController.uploadFiles);

  return app.use("/upload", router);
};*/

router.get('/upload', (req,res)=>{
    res.render('upload_test');
});

router.post('/upload',upload.single("file"),uploadController.uploadFiles);

module.exports = router;