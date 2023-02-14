import 'Data.dart';

class LoginResponse {
  LoginResponse({
      this.status, 
      this.data, 
      this.error,});

  LoginResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error = json['error'];
  }
  bool status;
  Data data;
  String error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data.toJson();
    }
    map['error'] = error;
    return map;
  }

}