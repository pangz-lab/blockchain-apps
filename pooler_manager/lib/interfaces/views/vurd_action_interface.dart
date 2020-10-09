class VurdActionInterface {
  VurdActionInterface({
    this.view,
    this.update,
    this.delete,
    this.run
  });
  Function view = () {};
  Function update = () {};
  Function delete = () {};
  Function run = () {};
}