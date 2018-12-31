import 'Status.dart';

class Resource<T> {
  T data;
  String message;
  Status status;

  Resource(this.data, this.message, this.status);

  static Resource success(data) {
    return Resource(data, null, Status.SUCCESS);
  }

  static Resource error(data, String msg) {
    var resource = Resource(data, msg, Status.ERROR);
    resource.message = msg;
    return resource;
  }

  static Resource loading(data) {
    return Resource(data, null, Status.LOADING);
  }
}
