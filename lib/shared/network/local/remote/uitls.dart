import 'package:task_manager_app/shared/network/local/remote/request_helper.dart';

class Uitls {
  static String? RequestTypeToString(RequestType requestType) {
    String? type = '';
    switch (requestType) {
      case RequestType.GET:
        {
          type = 'GET';
        }
        break;
      case RequestType.POST:
        {
          type = 'POST';
        }
        break;
      case RequestType.DELETE:
        {
          type = 'DELETE';
        }
        break;
      case RequestType.PATCH:
        {
          type = 'PATCH';
        }
        break;
    }
    return type;
  }
}
