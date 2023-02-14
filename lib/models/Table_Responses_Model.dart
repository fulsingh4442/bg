import 'dart:convert';
/// status : true
/// login : true
/// data : {"iTotalRecords":1,"aaData":[{"id":76,"date":"11-11-2022","paid_amount":"£0","min_spend":null,"payment_method":"stripe","booking_uid":"LIZ13813","arrived_at":null,"checkin_status":0,"name":"Booth#3 - Table for 8","guest":"Lee Hudson","unit_id":"3","category_id":"2","checkin_time":"","type":"table","addons":[{"name":"Iguana","rate_quantity":"£220x1","booking_id":"76","total":"£220"}]}]}

TableResponsesModel tableResponsesModelFromJson(String str) => TableResponsesModel.fromJson(json.decode(str));
String tableResponsesModelToJson(TableResponsesModel data) => json.encode(data.toJson());
class TableResponsesModel {
  TableResponsesModel({
      bool status,
      bool login,
      Data data,}){
    _status = status;
    _login = login;
    _data = data;
}

  TableResponsesModel.fromJson(dynamic json) {
    _status = json['status'];
    _login = json['login'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool _status;
  bool _login;
  Data _data;
TableResponsesModel copyWith({  bool status,
  bool login,
  Data data,
}) => TableResponsesModel(  status: status ?? _status,
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
/// aaData : [{"id":76,"date":"11-11-2022","paid_amount":"£0","min_spend":null,"payment_method":"stripe","booking_uid":"LIZ13813","arrived_at":null,"checkin_status":0,"name":"Booth#3 - Table for 8","guest":"Lee Hudson","unit_id":"3","category_id":"2","checkin_time":"","type":"table","addons":[{"name":"Iguana","rate_quantity":"£220x1","booking_id":"76","total":"£220"}]}]

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

/// id : 76
/// date : "11-11-2022"
/// paid_amount : "£0"
/// min_spend : null
/// payment_method : "stripe"
/// booking_uid : "LIZ13813"
/// arrived_at : null
/// checkin_status : 0
/// name : "Booth#3 - Table for 8"
/// guest : "Lee Hudson"
/// unit_id : "3"
/// category_id : "2"
/// checkin_time : ""
/// type : "table"
/// addons : [{"name":"Iguana","rate_quantity":"£220x1","booking_id":"76","total":"£220"}]

AaData aaDataFromJson(String str) => AaData.fromJson(json.decode(str));
String aaDataToJson(AaData data) => json.encode(data.toJson());
class AaData {
  AaData({
      num id,
      String date,
      String paidAmount,
      dynamic minSpend, 
      String paymentMethod,
      String bookingUid,
      dynamic arrivedAt, 
      num checkinStatus,
      String name,
      String guest,
      String unitId,
      String categoryId,
      String checkinTime,
      String type,
      List<Addons> addons,}){
    _id = id;
    _date = date;
    _paidAmount = paidAmount;
    _minSpend = minSpend;
    _paymentMethod = paymentMethod;
    _bookingUid = bookingUid;
    _arrivedAt = arrivedAt;
    _checkinStatus = checkinStatus;
    _name = name;
    _guest = guest;
    _unitId = unitId;
    _categoryId = categoryId;
    _checkinTime = checkinTime;
    _type = type;
    _addons = addons;
}

  AaData.fromJson(dynamic json) {
    _id = json['id'];
    _date = json['date'];
    _paidAmount = json['paid_amount'];
    _minSpend = json['min_spend'];
    _paymentMethod = json['payment_method'];
    _bookingUid = json['booking_uid'];
    _arrivedAt = json['arrived_at'];
    _checkinStatus = json['checkin_status'];
    _name = json['name'];
    _guest = json['guest'];
    _unitId = json['unit_id'];
    _categoryId = json['category_id'];
    _checkinTime = json['checkin_time'];
    _type = json['type'];
    if (json['addons'] != null) {
      _addons = [];
      json['addons'].forEach((v) {
        _addons?.add(Addons.fromJson(v));
      });
    }
  }
  num _id;
  String _date;
  String _paidAmount;
  dynamic _minSpend;
  String _paymentMethod;
  String _bookingUid;
  dynamic _arrivedAt;
  num _checkinStatus;
  String _name;
  String _guest;
  String _unitId;
  String _categoryId;
  String _checkinTime;
  String _type;
  List<Addons> _addons;
AaData copyWith({  num id,
  String date,
  String paidAmount,
  dynamic minSpend,
  String paymentMethod,
  String bookingUid,
  dynamic arrivedAt,
  num checkinStatus,
  String name,
  String guest,
  String unitId,
  String categoryId,
  String checkinTime,
  String type,
  List<Addons> addons,
}) => AaData(  id: id ?? _id,
  date: date ?? _date,
  paidAmount: paidAmount ?? _paidAmount,
  minSpend: minSpend ?? _minSpend,
  paymentMethod: paymentMethod ?? _paymentMethod,
  bookingUid: bookingUid ?? _bookingUid,
  arrivedAt: arrivedAt ?? _arrivedAt,
  checkinStatus: checkinStatus ?? _checkinStatus,
  name: name ?? _name,
  guest: guest ?? _guest,
  unitId: unitId ?? _unitId,
  categoryId: categoryId ?? _categoryId,
  checkinTime: checkinTime ?? _checkinTime,
  type: type ?? _type,
  addons: addons ?? _addons,
);
  num get id => _id;
  String get date => _date;
  String get paidAmount => _paidAmount;
  dynamic get minSpend => _minSpend;
  String get paymentMethod => _paymentMethod;
  String get bookingUid => _bookingUid;
  dynamic get arrivedAt => _arrivedAt;
  num get checkinStatus => _checkinStatus;
  String get name => _name;
  String get guest => _guest;
  String get unitId => _unitId;
  String get categoryId => _categoryId;
  String get checkinTime => _checkinTime;
  String get type => _type;
  List<Addons> get addons => _addons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date'] = _date;
    map['paid_amount'] = _paidAmount;
    map['min_spend'] = _minSpend;
    map['payment_method'] = _paymentMethod;
    map['booking_uid'] = _bookingUid;
    map['arrived_at'] = _arrivedAt;
    map['checkin_status'] = _checkinStatus;
    map['name'] = _name;
    map['guest'] = _guest;
    map['unit_id'] = _unitId;
    map['category_id'] = _categoryId;
    map['checkin_time'] = _checkinTime;
    map['type'] = _type;
    if (_addons != null) {
      map['addons'] = _addons?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Iguana"
/// rate_quantity : "£220x1"
/// booking_id : "76"
/// total : "£220"

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