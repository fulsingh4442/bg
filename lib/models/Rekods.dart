import 'dart:convert';
/// login : true
/// data : {"iTotalRecords":2,"aaData":{"table":{"total":"02","booked":"16","checked_id":"0"},"total":{"sold":16,"checkedin":0}}}
/// status : true

Rekods rekodsFromJson(String str) => Rekods.fromJson(json.decode(str));
String rekodsToJson(Rekods data) => json.encode(data.toJson());
class Rekods {
  Rekods({
      bool login,
      Data data,
      bool status,}){
    _login = login;
    _data = data;
    _status = status;
}

  Rekods.fromJson(dynamic json) {
    _login = json['login'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
  }
  bool _login;
  Data _data;
  bool _status;
Rekods copyWith({  bool login,
  Data data,
  bool status,
}) => Rekods(  login: login ?? _login,
  data: data ?? _data,
  status: status ?? _status,
);
  bool get login => _login;
  Data get data => _data;
  bool get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['login'] = _login;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    return map;
  }

}

/// iTotalRecords : 2
/// aaData : {"table":{"total":"02","booked":"16","checked_id":"0"},"total":{"sold":16,"checkedin":0}}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      num iTotalRecords,
      AaData aaData,}){
    _iTotalRecords = iTotalRecords;
    _aaData = aaData;
}

  Data.fromJson(dynamic json) {
    _iTotalRecords = json['iTotalRecords'];
    _aaData = json['aaData'] != null ? AaData.fromJson(json['aaData']) : null;
  }
  num _iTotalRecords;
  AaData _aaData;
Data copyWith({  num iTotalRecords,
  AaData aaData,
}) => Data(  iTotalRecords: iTotalRecords ?? _iTotalRecords,
  aaData: aaData ?? _aaData,
);
  num get iTotalRecords => _iTotalRecords;
  AaData get aaData => _aaData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iTotalRecords'] = _iTotalRecords;
    if (_aaData != null) {
      map['aaData'] = _aaData?.toJson();
    }
    return map;
  }

}

/// table : {"total":"02","booked":"16","checked_id":"0"}
/// total : {"sold":16,"checkedin":0}

AaData aaDataFromJson(String str) => AaData.fromJson(json.decode(str));
String aaDataToJson(AaData data) => json.encode(data.toJson());
class AaData {
  AaData({
      Table table,
      Total total,}){
    _table = table;
    _total = total;
}

  AaData.fromJson(dynamic json) {
    _table = json['table'] != null ? Table.fromJson(json['table']) : null;
    _total = json['total'] != null ? Total.fromJson(json['total']) : null;
  }
  Table _table;
  Total _total;
AaData copyWith({  Table table,
  Total total,
}) => AaData(  table: table ?? _table,
  total: total ?? _total,
);
  Table get table => _table;
  Total get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_table != null) {
      map['table'] = _table?.toJson();
    }
    if (_total != null) {
      map['total'] = _total?.toJson();
    }
    return map;
  }

}

/// sold : 16
/// checkedin : 0

Total totalFromJson(String str) => Total.fromJson(json.decode(str));
String totalToJson(Total data) => json.encode(data.toJson());
class Total {
  Total({
      num sold,
      num checkedin,}){
    _sold = sold;
    _checkedin = checkedin;
}

  Total.fromJson(dynamic json) {
    _sold = json['sold'];
    _checkedin = json['checkedin'];
  }
  num _sold;
  num _checkedin;
Total copyWith({  num sold,
  num checkedin,
}) => Total(  sold: sold ?? _sold,
  checkedin: checkedin ?? _checkedin,
);
  num get sold => _sold;
  num get checkedin => _checkedin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = _sold;
    map['checkedin'] = _checkedin;
    return map;
  }

}

/// total : "02"
/// booked : "16"
/// checked_id : "0"

Table tableFromJson(String str) => Table.fromJson(json.decode(str));
String tableToJson(Table data) => json.encode(data.toJson());
class Table {
  Table({
      String total,
      String booked,
      String checkedId,}){
    _total = total;
    _booked = booked;
    _checkedId = checkedId;
}

  Table.fromJson(dynamic json) {
    _total = json['total'];
    _booked = json['booked'];
    _checkedId = json['checked_id'];
  }
  String _total;
  String _booked;
  String _checkedId;
Table copyWith({  String total,
  String booked,
  String checkedId,
}) => Table(  total: total ?? _total,
  booked: booked ?? _booked,
  checkedId: checkedId ?? _checkedId,
);
  String get total => _total;
  String get booked => _booked;
  String get checkedId => _checkedId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    map['booked'] = _booked;
    map['checked_id'] = _checkedId;
    return map;
  }

}