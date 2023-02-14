import 'dart:convert';
/// status : true
/// login : true
/// data : {"iTotalRecords":1,"aaData":[{"id":4483,"date":"03-12-2022","quantity":"2","paid_amount":"£10","booking_uid":"LIZ14550","checkin_status":0,"arrived_at":null,"name":"Finesse Saturdays - Get Shipfaced - Finesse presents - 'Get Shipfaced'","guest":"jemma east","event_ticket_id":"166","checkin_time":"","type":"event","checkin_guest":"0","addons":[{"name":"Gecko","rate_quantity":"£100x1","booking_id":"4483","total":"£100"}]}]}

EventResponsesModel eventResponsesModelFromJson(String str) => EventResponsesModel.fromJson(json.decode(str));
String eventResponsesModelToJson(EventResponsesModel data) => json.encode(data.toJson());
class EventResponsesModel {
  EventResponsesModel({
      bool status,
      bool login,
      Data data,}){
    _status = status;
    _login = login;
    _data = data;
}

  EventResponsesModel.fromJson(dynamic json) {
    _status = json['status'];
    _login = json['login'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool _status;
  bool _login;
  Data _data;
EventResponsesModel copyWith({  bool status,
  bool login,
  Data data,
}) => EventResponsesModel(  status: status ?? _status,
  login: login ?? _login,
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

/// iTotalRecords : 1
/// aaData : [{"id":4483,"date":"03-12-2022","quantity":"2","paid_amount":"£10","booking_uid":"LIZ14550","checkin_status":0,"arrived_at":null,"name":"Finesse Saturdays - Get Shipfaced - Finesse presents - 'Get Shipfaced'","guest":"jemma east","event_ticket_id":"166","checkin_time":"","type":"event","checkin_guest":"0","addons":[{"name":"Gecko","rate_quantity":"£100x1","booking_id":"4483","total":"£100"}]}]

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

/// id : 4483
/// date : "03-12-2022"
/// quantity : "2"
/// paid_amount : "£10"
/// booking_uid : "LIZ14550"
/// checkin_status : 0
/// arrived_at : null
/// name : "Finesse Saturdays - Get Shipfaced - Finesse presents - 'Get Shipfaced'"
/// guest : "jemma east"
/// event_ticket_id : "166"
/// checkin_time : ""
/// type : "event"
/// checkin_guest : "0"
/// addons : [{"name":"Gecko","rate_quantity":"£100x1","booking_id":"4483","total":"£100"}]

AaData aaDataFromJson(String str) => AaData.fromJson(json.decode(str));
String aaDataToJson(AaData data) => json.encode(data.toJson());
class AaData {
  AaData({
      num id,
      String date,
      String quantity,
      String paidAmount,
      String bookingUid,
      num checkinStatus,
      dynamic arrivedAt, 
      String name,
      String guest,
      String eventTicketId,
      String checkinTime,
      String type,
      String checkinGuest,
      List<Addons> addons,}){
    _id = id;
    _date = date;
    _quantity = quantity;
    _paidAmount = paidAmount;
    _bookingUid = bookingUid;
    _checkinStatus = checkinStatus;
    _arrivedAt = arrivedAt;
    _name = name;
    _guest = guest;
    _eventTicketId = eventTicketId;
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
    _bookingUid = json['booking_uid'];
    _checkinStatus = json['checkin_status'];
    _arrivedAt = json['arrived_at'];
    _name = json['name'];
    _guest = json['guest'];
    _eventTicketId = json['event_ticket_id'];
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
  String _bookingUid;
  num _checkinStatus;
  dynamic _arrivedAt;
  String _name;
  String _guest;
  String _eventTicketId;
  String _checkinTime;
  String _type;
  String _checkinGuest;
  List<Addons> _addons;
AaData copyWith({  num id,
  String date,
  String quantity,
  String paidAmount,
  String bookingUid,
  num checkinStatus,
  dynamic arrivedAt,
  String name,
  String guest,
  String eventTicketId,
  String checkinTime,
  String type,
  String checkinGuest,
  List<Addons> addons,
}) => AaData(  id: id ?? _id,
  date: date ?? _date,
  quantity: quantity ?? _quantity,
  paidAmount: paidAmount ?? _paidAmount,
  bookingUid: bookingUid ?? _bookingUid,
  checkinStatus: checkinStatus ?? _checkinStatus,
  arrivedAt: arrivedAt ?? _arrivedAt,
  name: name ?? _name,
  guest: guest ?? _guest,
  eventTicketId: eventTicketId ?? _eventTicketId,
  checkinTime: checkinTime ?? _checkinTime,
  type: type ?? _type,
  checkinGuest: checkinGuest ?? _checkinGuest,
  addons: addons ?? _addons,
);
  num get id => _id;
  String get date => _date;
  String get quantity => _quantity;
  String get paidAmount => _paidAmount;
  String get bookingUid => _bookingUid;
  num get checkinStatus => _checkinStatus;
  dynamic get arrivedAt => _arrivedAt;
  String get name => _name;
  String get guest => _guest;
  String get eventTicketId => _eventTicketId;
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
    map['booking_uid'] = _bookingUid;
    map['checkin_status'] = _checkinStatus;
    map['arrived_at'] = _arrivedAt;
    map['name'] = _name;
    map['guest'] = _guest;
    map['event_ticket_id'] = _eventTicketId;
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