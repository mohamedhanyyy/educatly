import '../entity_factory.dart';
import 'network_constant.dart';

///Basic classes for data analysis
class BaseResponse<T> {
  T? data;
  int? code;
  String? message;
  List<T>? listData = [];
  List<String> errors = [];

  BaseResponse(
    this.data,
    this.code,
    this.errors,
  );

  BaseResponse.fromJson(Map<String, dynamic> json) {
    code = json[NetworkConstant.code];
    for (var item in (json[NetworkConstant.errors] as List)) {
      errors.add(item.toString());
    }

    if (json.containsKey(NetworkConstant.data)) {
      if (json[NetworkConstant.data] is List) {
        for (var item in (json[NetworkConstant.data] as List)) {
          if (T.toString() == "String") {
            listData?.add(item.toString() as T);
          } else {
            listData?.add(EntityFactory.generateOBJ<T>(item) as T);
          }
        }
      } else {
        if (T.toString() == "String") {
          data = json[NetworkConstant.data].toString() as T;
        } else if (T.toString() == "Map<dynamic, dynamic>") {
          data = json[NetworkConstant.data] as T;
        } else {
          data = EntityFactory.generateOBJ(json[NetworkConstant.data]);
        }
      }
      // Data retrieved as json not in data key
    } else {
      if (T.toString() == "String") {
        data = json.toString() as T;
      } else if (T.toString() == "Map<dynamic, dynamic>") {
        data = json as T;
      } else {
        data = EntityFactory.generateOBJ(json);
      }
    }
  }

  @override
  String toString() {
    return 'BaseResponse(code: $code, message: $message,  data: $data, listData: $listData, errors: $errors)';
  }
}
