class ActionButtonInterface {
  ActionButtonInterface({
    this.view,
    this.update,
    this.delete,
    this.run,
    this.pause,
    this.stop,
  });
  Function view = () {};
  Function update = () {};
  Function delete = () {};
  Function run = () {};
  Function pause = () {};
  Function stop = () {};
}