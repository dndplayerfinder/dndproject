
module.exports = (sequelize, DataTypes) => {
    const Image = sequelize.define("image", {
      name: {
        type: DataTypes.STRING,
      },
      data: {
        type: DataTypes.BLOB("long"),
      },
    });
  
    return Image;
  };