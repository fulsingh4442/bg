import 'dart:convert';
/// status : false
/// message : ""
/// data : ""
/// error : "Guest already check-in."

ChackInResponse chackInResponseFromJson(String str) => ChackInResponse.fromJson(json.decode(str));
String chackInResponseToJson(ChackInResponse data) => json.encode(data.toJson());
class ChackInResponse {
  ChackInResponse({
      bool status,
      String message,
      String data,
      String error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  ChackInResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];
    _error = json['error'];
  }
  bool _status;
  String _message;
  String _data;
  String _error;
ChackInResponse copyWith({  bool status,
  String message,
  String data,
  String error,
}) => ChackInResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  error: error ?? _error,
);
  bool get status => _status;
  String get message => _message;
  String get data => _data;
  String get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['data'] = _data;
    map['error'] = _error;
    return map;
  }

}