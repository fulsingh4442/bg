import 'dart:convert';
/// status : true
/// login : true
/// data : {"iTotalRecords":2,"aaData":[{"id":1,"date":"19-08-2022","paid_amount":"£100","min_spend":null,"payment_method":"paypal","booking_uid":"LIZ10001","arrived_at":"2022-08-19 11:05:31","checkin_status":1,"name":"Booth #1 - Table for 10","guest":"Ashutosh Singh","unit_id":"1","category_id":"1","checkin_time":"11:05","type":"table"},{"id":1,"date":"19-08-2022","quantity":"4","paid_amount":"£80","booking_uid":"LIZ10001","checkin_status":0,"arrived_at":null,"name":"Ticket #1 - API Test Event","guest":"Ashutosh Singh","event_ticket_id":"19","checkin_time":"","type":"event","checkin_guest":"1","addons":[{"name":"Gecko","rate_quantity":"£100x1","booking_id":"4483","total":"£100"}]}]}

EventTableResponse eventTableResponseFromJson(String str) => EventTableResponse.fromJson(json.decode(str));
String eventTableResponseToJson(EventTableResponse data) => json.encode(data.toJson());
class EventTableResponse {
  EventTableResponse({
      bool status,
    bool login,
      Data data,}){
    _status = status;
    _login = login;
    _data = data;
}

  EventTableResponse.fromJson(dynamic json) {
    _status = json['status'];
    _login = json['login'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool _status;
  bool _login;
  Data _data;
EventTableResponse copyWith({  bool status,
  Data data,
}) => EventTableResponse(  status: status ?? _status,login: login ?? _login,
  data: data ?? _data,
);

  bool get status => _status;
  bool get login => _login;
  Data get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['login'] = _login;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// iTotalRecords : 2
/// aaData : [{"id":1,"date":"19-08-2022","paid_amount":"£100","min_spend":null,"payment_method":"paypal","booking_uid":"LIZ10001","arrived_at":"2022-08-19 11:05:31","checkin_status":1,"name":"Booth #1 - Table for 10","guest":"Ashutosh Singh","unit_id":"1","category_id":"1","checkin_time":"11:05","type":"table"},{"id":1,"date":"19-08-2022","quantity":"4","paid_amount":"£80","booking_uid":"LIZ10001","checkin_status":0,"arrived_at":null,"name":"Ticket #1 - API Test Event","guest":"Ashutosh Singh","event_ticket_id":"19","checkin_time":"","type":"event","checkin_guest":"1","addons":[{"name":"Gecko","rate_quantity":"£100x1","booking_id":"4483","total":"£100"}]}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num iTotalRecords,
      List<AaData> aaData,}){
    _iTotalRecords = iTotalRecords;
    _aaData = aaData;
}

  Data.fromJson(dynamic json) {
    _iTotalRecords = json['iTotalRecords'];
    if (json['aaData'] != null) {
      _aaData = [];
      json['aaData'].forEach((v) {
        _aaData?.add(AaData.fromJson(v));
      });
    }
  }
  num _iTotalRecords;
  List<AaData> _aaData;
Data copyWith({  num iTotalRecords,
  List<AaData> aaData,
}) => Data(  iTotalRecords: iTotalRecords ?? _iTotalRecords,
  aaData: aaData ?? _aaData,
);
  num get iTotalRecords => _iTotalRecords;
  List<AaData> get aaData => _aaData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iTotalRecords'] = _iTotalRecords;
    if (_aaData != null) {
      map['aaData'] = _aaData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// date : "19-08-2022"
///  "quantity": "4",
/// paid_amount : "£100"
/// min_spend : null
/// payment_method : "paypal"
/// booking_uid : "LIZ10001"
/// arrived_at : "2022-08-19 11:05:31"
/// checkin_status : 1
/// name : "Booth #1 - Table for 10"
/// guest : "Ashutosh Singh"
/// "event_ticket_id": "19",
/// unit_id : "1"
/// category_id : "1"
/// checkin_time : "11:05"
/// type : "table"
/// "checkin_guest": "1"
/// addons : [{"name":"Gecko","rate_quantity":"£100x1","booking_id":"4483","total":"£100"}]


AaData aaDataFromJson(String str) => AaData.fromJson(json.decode(str));
String aaDataToJson(AaData data) => json.encode(data.toJson());
class AaData {
  AaData({
      num id,
      String date,
    String quantity,
    String paidAmount,
      dynamic minSpend, 
      String paymentMethod,
      String bookingUid,
      String arrivedAt,
      num checkinStatus,
      String name,
      String guest,
    String event_ticket_id,
      String unitId,
      String categoryId,
      String checkinTime,
      String type,
     String checkinGuest,
    List<Addons> addons,
  }){

    _id = id;
    _date = date;
    _quantity = quantity;
    _paidAmount = paidAmount;
    _minSpend = minSpend;
    _paymentMethod = paymentMethod;
    _bookingUid = bookingUid;
    _arrivedAt = arrivedAt;
    _checkinStatus = checkinStatus;
    _name = name;
    _guest = guest;
    _event_ticket_id = event_ticket_id;
    _unitId = unitId;
    _categoryId = categoryId;
    _checkinTime = checkinTime;
    _type = type;
    _checkinGuest = checkinGuest;
    _addons = addons;
}

  AaData.fromJson(dynamic json) {
    _id = json['id'];
    _date = json['date'];
    _quantity = json['quantity'];
    _paidAmount = json['paid_amount'];
    _minSpend = json['min_spend'];
    _paymentMethod = json['payment_method'];
    _bookingUid = json['booking_uid'];
    _arrivedAt = json['arrived_at'];
    _checkinStatus = json['checkin_status'];
    _name = json['name'];
    _guest = json['guest'];
    _event_ticket_id = json['event_ticket_id'];
    _unitId = json['unit_id'];
    _categoryId = json['category_id'];
    _checkinTime = json['checkin_time'];
    _type = json['type'];
    _checkinGuest = json['checkin_guest'];
    if (json['addons'] != null) {
      _addons = [];
      json['addons'].forEach((v) {
        _addons?.add(Addons.fromJson(v));
      });
    }
  }
  num _id;
  String _date;
  String _quantity;
  String _paidAmount;
  dynamic _minSpend;
  String _paymentMethod;
  String _bookingUid;
  String _arrivedAt;
  num _checkinStatus;
  String _name;
  String _guest;
  String _event_ticket_id;
  String _unitId;
  String _categoryId;
  String _checkinTime;
  String _type;
  String _checkinGuest;
  List<Addons> _addons;
AaData copyWith({  num id,
  String date,
  String quantity,
  String paidAmount,
  dynamic minSpend,
  String paymentMethod,
  String bookingUid,
  String arrivedAt,
  num checkinStatus,
  String name,
  String guest,
  String event_ticket_id,
  String unitId,
  String categoryId,
  String checkinTime,
  String type,
  String checkinGuest,
  List<Addons> addons,
}) => AaData(  id: id ?? _id,
  date: date ?? _date,
  quantity: quantity ?? _quantity,
  paidAmount: paidAmount ?? _paidAmount,
  minSpend: minSpend ?? _minSpend,
  paymentMethod: paymentMethod ?? _paymentMethod,
  bookingUid: bookingUid ?? _bookingUid,
  arrivedAt: arrivedAt ?? _arrivedAt,
  checkinStatus: checkinStatus ?? _checkinStatus,
  name: name ?? _name,
  guest: guest ?? _guest,
  event_ticket_id: event_ticket_id ?? _event_ticket_id,
  unitId: unitId ?? _unitId,
  categoryId: categoryId ?? _categoryId,
  checkinTime: checkinTime ?? _checkinTime,
  type: type ?? _type,
  checkinGuest: checkinGuest ?? _checkinGuest,
  addons: addons ?? _addons,
);
  num get id => _id;
  String get date => _date;
  String get quantity => _quantity;
  String get paidAmount => _paidAmount;
  dynamic get minSpend => _minSpend;
  String get paymentMethod => _paymentMethod;
  String get bookingUid => _bookingUid;
  String get arrivedAt => _arrivedAt;
  num get checkinStatus => _checkinStatus;
  String get name => _name;
  String get guest => _guest;
  String get event_ticket_id => _event_ticket_id;
  String get unitId => _unitId;
  String get categoryId => _categoryId;
  String get checkinTime => _checkinTime;
  String get type => _type;
  String get checkinGuest => _checkinGuest;
  List<Addons> get addons => _addons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date'] = _date;
    map['quantity'] = _quantity;
    map['paid_amount'] = _paidAmount;
    map['min_spend'] = _minSpend;
    map['payment_method'] = _paymentMethod;
    map['booking_uid'] = _bookingUid;
    map['arrived_at'] = _arrivedAt;
    map['checkin_status'] = _checkinStatus;
    map['name'] = _name;
    map['guest'] = _guest;
    map['event_ticket_id'] = _event_ticket_id;
    map['unit_id'] = _unitId;
    map['category_id'] = _categoryId;
    map['checkin_time'] = _checkinTime;
    map['type'] = _type;
    map['checkin_guest'] = _checkinGuest;
    if (_addons != null) {
      map['addons'] = _addons?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


/// name : "Gecko"
/// rate_quantity : "£100x1"
/// booking_id : "4483"
/// total : "£100"

Addons addonsFromJson(String str) => Addons.fromJson(json.decode(str));
String addonsToJson(Addons data) => json.encode(data.toJson());
class Addons {
  Addons({
    String name,
    String rateQuantity,
    String bookingId,
    String total,}){
    _name = name;
    _rateQuantity = rateQuantity;
    _bookingId = bookingId;
    _total = total;
  }

  Addons.fromJson(dynamic json) {
    _name = json['name'];
    _rateQuantity = json['rate_quantity'];
    _bookingId = json['booking_id'];
    _total = json['total'];
  }
  String _name;
  String _rateQuantity;
  String _bookingId;
  String _total;
  Addons copyWith({  String name,
    String rateQuantity,
    String bookingId,
    String total,
  }) => Addons(  name: name ?? _name,
    rateQuantity: rateQuantity ?? _rateQuantity,
    bookingId: bookingId ?? _bookingId,
    total: total ?? _total,
  );
  String get name => _name;
  String get rateQuantity => _rateQuantity;
  String get bookingId => _bookingId;
  String get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['rate_quantity'] = _rateQuantity;
    map['booking_id'] = _bookingId;
    map['total'] = _total;
    return map;
  }

}