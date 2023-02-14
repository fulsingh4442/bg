import 'dart:convert';
/// status : true
/// message : "Guest Check-in"
/// data : {"status":"checkin","checkin_time":"12:17"}

GuestChecjResponse guestChecjResponseFromJson(String str) => GuestChecjResponse.fromJson(json.decode(str));
String guestChecjResponseToJson(GuestChecjResponse data) => json.encode(data.toJson());
class GuestChecjResponse {
  GuestChecjResponse({
      bool status,
      String message,
      Data data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GuestChecjResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool _status;
  String _message;
  Data _data;
GuestChecjResponse copyWith({  bool status,
  String message,
  Data data,
}) => GuestChecjResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool get status => _status;
  String get message => _message;
  Data get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// status : "checkin"
/// checkin_time : "12:17"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String status,
      String checkinTime,}){
    _status = status;
    _checkinTime = checkinTime;
}

  Data.fromJson(dynamic json) {
    _status = json['status'];
    _checkinTime = json['checkin_time'];
  }
  String _status;
  String _checkinTime;
Data copyWith({  String status,
  String checkinTime,
}) => Data(  status: status ?? _status,
  checkinTime: checkinTime ?? _checkinTime,
);
  String get status => _status;
  String get checkinTime => _checkinTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['checkin_time'] = _checkinTime;
    return map;
  }

}