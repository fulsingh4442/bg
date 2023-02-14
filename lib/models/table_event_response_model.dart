// import 'dart:convert';
// /// status : true
// /// login : true
// /// data : {"iTotalRecords":2,"aaData":[{"id":1,"date":"19-08-2022","paid_amount":"£100","min_spend":null,"payment_method":"paypal","booking_uid":"LIZ10001","arrived_at":"2022-08-19 11:12:56","checkin_status":1,"name":"Booth #1 - Table for 10","guest":"Ashutosh Singh","unit_id":"1","category_id":"1","checkin_time":"11:12","type":"table"},{"id":1,"date":"19-08-2022","quantity":"4","paid_amount":"£80","booking_uid":"LIZ10001","checkin_status":0,"name":"Ticket #1 - API Test Event","guest":"Ashutosh Singh","event_ticket_idevent_ticket_idevent_ticket_idevent_ticket_id":"19","checkin_time":"","type":"event","checkin_guest":"0"}]}
//
// TableEventResponseModel tableEventResponseModelFromJson(String str) => TableEventResponseModel.fromJson(json.decode(str));
// String tableEventResponseModelToJson(TableEventResponseModel data) => json.encode(data.toJson());
// class TableEventResponseModel {
//   TableEventResponseModel({
//       bool status,
//     bool login,
//       Data data,}){
//     _status = status;
//     _login = login;
//     _data = data;
// }
//
//   TableEventResponseModel.fromJson(dynamic json) {
//     _status = json['status'];
//     _login = json['_login'];
//     _data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//   bool _status;
//   bool _login;
//   Data _data;
// TableEventResponseModel copyWith({  bool status,
//   Data data,
// }) => TableEventResponseModel(  status: status ?? _status, login: login ?? _login,
//   data: data ?? _data,
// );
//   bool get status => _status;
//   bool get login => _login;
//   Data get data => _data;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = _status;
//     map['login'] = _login;
//     if (_data != null) {
//       map['data'] = _data?.toJson();
//     }
//     return map;
//   }
//
// }
//
// /// iTotalRecords : 2
// /// aaData : [{"id":1,"date":"19-08-2022","paid_amount":"£100","min_spend":null,"payment_method":"paypal","booking_uid":"LIZ10001","arrived_at":"2022-08-19 11:12:56","checkin_status":1,"name":"Booth #1 - Table for 10","guest":"Ashutosh Singh","unit_id":"1","category_id":"1","checkin_time":"11:12","type":"table"},{"id":1,"date":"19-08-2022","quantity":"4","paid_amount":"£80","booking_uid":"LIZ10001","checkin_status":0,"name":"Ticket #1 - API Test Event","guest":"Ashutosh Singh","event_ticket_idevent_ticket_idevent_ticket_idevent_ticket_id":"19","checkin_time":"","type":"event","checkin_guest":"0"}]
//
// Data dataFromJson(String str) => Data.fromJson(json.decode(str));
// String dataToJson(Data data) => json.encode(data.toJson());
// class Data {
//   Data({
//       num iTotalRecords,
//       List<AaData> aaData,}){
//     _iTotalRecords = iTotalRecords;
//     _aaData = aaData;
// }
//
//   Data.fromJson(dynamic json) {
//     _iTotalRecords = json['iTotalRecords'];
//     if (json['aaData'] != null) {
//       _aaData = [];
//       json['aaData'].forEach((v) {
//         _aaData?.add(AaData.fromJson(v));
//       });
//     }
//   }
//   num _iTotalRecords;
//   List<AaData> _aaData;
// Data copyWith({  num iTotalRecords,
//   List<AaData> aaData,
// }) => Data(  iTotalRecords: iTotalRecords ?? _iTotalRecords,
//   aaData: aaData ?? _aaData,
// );
//   num get iTotalRecords => _iTotalRecords;
//   List<AaData> get aaData => _aaData;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['iTotalRecords'] = _iTotalRecords;
//     if (_aaData != null) {
//       map['aaData'] = _aaData?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// /// id : 1
// /// date : "19-08-2022"
// /// paid_amount : "£100"
// /// min_spend : null
// /// payment_method : "paypal"
// /// booking_uid : "LIZ10001"
// /// arrived_at : "2022-08-19 11:12:56"
// /// checkin_status : 1
// /// name : "Booth #1 - Table for 10"
// /// guest : "Ashutosh Singh"
// /// unit_id : "1"
// /// category_id : "1"
// /// checkin_time : "11:12"
// /// type : "table"
//
// AaData aaDataFromJson(String str) => AaData.fromJson(json.decode(str));
// String aaDataToJson(AaData data) => json.encode(data.toJson());
// class AaData {
//   AaData({
//       num id,
//       String date,
//       String paidAmount,
//       dynamic minSpend,
//
//   var quantity,
//   String paymentMethod,
//       String bookingUid,
//       String arrivedAt,
//       num checkinStatus,
//       String name,
//       String guest,
//       String unitId,
//       String categoryId,
//       String checkinTime,
//       String type,}){
//     _id = id;
//     _date = date;
//     _paidAmount = paidAmount;
//     _minSpend = minSpend;
//     _paymentMethod = paymentMethod;
//     _bookingUid = bookingUid;
//     _arrivedAt = arrivedAt;
//     _checkinStatus = checkinStatus;
//     _name = name;
//     _guest = guest;
//     _unitId = unitId;
//     _categoryId = categoryId;
//     _checkinTime = checkinTime;
//     _type = type;
// }
//
//   AaData.fromJson(dynamic json) {
//     _id = json['id'];
//     _date = json['date'];
//     _paidAmount = json['paid_amount'];
//     _minSpend = json['min_spend'];
//     _paymentMethod = json['payment_method'];
//     _bookingUid = json['booking_uid'];
//     _arrivedAt = json['arrived_at'];
//     _checkinStatus = json['checkin_status'];
//     _name = json['name'];
//     _guest = json['guest'];
//     _unitId = json['unit_id'];
//     _categoryId = json['category_id'];
//     _checkinTime = json['checkin_time'];
//     _type = json['type'];
//   }
//   num _id;
//   String _date;
//   String _paidAmount;
//   dynamic _minSpend;
//   String _paymentMethod;
//   String _bookingUid;
//   String _arrivedAt;
//   num _checkinStatus;
//   String _name;
//   String _guest;
//   String _unitId;
//   String _categoryId;
//   String _checkinTime;
//   String _type;
//
//
//
//
// AaData copyWith({  num id,
//   String date,
//   String paidAmount,
//   dynamic minSpend,
//   String paymentMethod,
//   String bookingUid,
//   String arrivedAt,
//
//   num checkinStatus,
//   String name,
//   String guest,
//   String unitId,
//   String categoryId,
//   String checkinTime,
//   String type,
// }) => AaData(  id: id ?? _id,
//   date: date ?? _date,
//   paidAmount: paidAmount ?? _paidAmount,
//   minSpend: minSpend ?? _minSpend,
//   paymentMethod: paymentMethod ?? _paymentMethod,
//   bookingUid: bookingUid ?? _bookingUid,
//   arrivedAt: arrivedAt ?? _arrivedAt,
//   checkinStatus: checkinStatus ?? _checkinStatus,
//   name: name ?? _name,
//   guest: guest ?? _guest,
//   unitId: unitId ?? _unitId,
//   categoryId: categoryId ?? _categoryId,
//   checkinTime: checkinTime ?? _checkinTime,
//   type: type ?? _type,
// );
//   num get id => _id;
//   String get date => _date;
//   String get paidAmount => _paidAmount;
//   dynamic get minSpend => _minSpend;
//   String get paymentMethod => _paymentMethod;
//   String get bookingUid => _bookingUid;
//   String get arrivedAt => _arrivedAt;
//   num get checkinStatus => _checkinStatus;
//   String get name => _name;
//   String get guest => _guest;
//   String get unitId => _unitId;
//   String get categoryId => _categoryId;
//   String get checkinTime => _checkinTime;
//   String get type => _type;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['date'] = _date;
//     map['paid_amount'] = _paidAmount;
//     map['min_spend'] = _minSpend;
//     map['payment_method'] = _paymentMethod;
//     map['booking_uid'] = _bookingUid;
//     map['arrived_at'] = _arrivedAt;
//     map['checkin_status'] = _checkinStatus;
//     map['name'] = _name;
//     map['guest'] = _guest;
//     map['unit_id'] = _unitId;
//     map['category_id'] = _categoryId;
//     map['checkin_time'] = _checkinTime;
//     map['type'] = _type;
//     return map;
//   }
//
// }