import 'dart:convert';
/// login : true
/// data : {"iTotalRecords":2,"aaData":{"table":{"total":"06","booked":"01","checked_id":"1"},"events":[{"id":"158","event":"API Test Event","tickets":"30","booked_ticket":0,"checked_id":0}]}}
/// status : true

ResponseTotle responseTotleFromJson(String str) => ResponseTotle.fromJson(json.decode(str));
String responseTotleToJson(ResponseTotle data) => json.encode(data.toJson());
class ResponseTotle {
  ResponseTotle({
      bool login,
      Data data,
      bool status,}){
    _login = login;
    _data = data;
    _status = status;
}

  ResponseTotle.fromJson(dynamic json) {
    _login = json['login'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
  }
  bool _login;
  Data _data;
  bool _status;
ResponseTotle copyWith({  bool login,
  Data data,
  bool status,
}) => ResponseTotle(  login: login ?? _login,
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
/// aaData : {"table":{"total":"06","booked":"01","checked_id":"1"},"events":[{"id":"158","event":"API Test Event","tickets":"30","booked_ticket":0,"checked_id":0}]}

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

/// table : {"total":"06","booked":"01","checked_id":"1"}
/// events : [{"id":"158","event":"API Test Event","tickets":"30","booked_ticket":0,"checked_id":0}]

AaData aaDataFromJson(String str) => AaData.fromJson(json.decode(str));
String aaDataToJson(AaData data) => json.encode(data.toJson());
class AaData {
  AaData({
      Table table,
      List<Events> events,}){
    _table = table;
    _events = events;
}

  AaData.fromJson(dynamic json) {
    _table = json['table'] != null ? Table.fromJson(json['table']) : null;
    if (json['events'] != null) {
      _events = [];
      json['events'].forEach((v) {
        _events?.add(Events.fromJson(v));
      });
    }
  }
  Table _table;
  List<Events> _events;
AaData copyWith({  Table table,
  List<Events> events,
}) => AaData(  table: table ?? _table,
  events: events ?? _events,
);
  Table get table => _table;
  List<Events> get events => _events;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_table != null) {
      map['table'] = _table?.toJson();
    }
    if (_events != null) {
      map['events'] = _events?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "158"
/// event : "API Test Event"
/// tickets : "30"
/// booked_ticket : 0
/// checked_id : 0

Events eventsFromJson(String str) => Events.fromJson(json.decode(str));
String eventsToJson(Events data) => json.encode(data.toJson());
class Events {
  Events({
      String id,
      String event,
      String tickets,
    num bookedTicket,
    num checkedId,}){
    _id = id;
    _event = event;
    _tickets = tickets;
    _bookedTicket = bookedTicket;
    _checkedId = checkedId;
}

  Events.fromJson(dynamic json) {
    _id = json['id'];
    _event = json['event'];
    _tickets = json['tickets'];
    _bookedTicket = json['booked_ticket'];
    _checkedId = json['checked_id'];
  }
  String _id;
  String _event;
  String _tickets;
  num _bookedTicket;
  num _checkedId;
Events copyWith({  String id,
  String event,
  String tickets,
  num bookedTicket,
  num checkedId,
}) => Events(  id: id ?? _id,
  event: event ?? _event,
  tickets: tickets ?? _tickets,
  bookedTicket: bookedTicket ?? _bookedTicket,
  checkedId: checkedId ?? _checkedId,
);
  String get id => _id;
  String get event => _event;
  String get tickets => _tickets;
  num get bookedTicket => _bookedTicket;
  num get checkedId => _checkedId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['event'] = _event;
    map['tickets'] = _tickets;
    map['booked_ticket'] = _bookedTicket;
    map['checked_id'] = _checkedId;
    return map;
  }

}

/// total : "06"
/// booked : "01"
/// checked_id : "1"

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