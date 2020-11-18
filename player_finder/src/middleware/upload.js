

const multer = require("multer");

const imageFilter = (req, file, cb) => {
  if (file.mimetype.startsWith("image")) {
    cb(null, true);
  } else {
    cb("Please upload only images.", false);
  }
};

var storage = multer.diskStorage({
  destination: function(req, file, cb){
    cb(null, __basedir + "/resources/static/assets/uploads/");
  },
  filename: function(req, file, cb){
    cb(null, `${file.originalname}`);

  },
});

var uploadFile = multer({ storage: storage, fileFilter: imageFilter });
console.log("Despues de multer");
console.log(uploadFile);
module.exports = uploadFile;
