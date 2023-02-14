import 'dart:convert';
/// login : true
/// data : {"iTotalRecords":3,"aaData":{"table":{"total":"05","booked":"00","checked_id":"0"},"events":[{"id":"232","event":"Taylor Tuesdays hosted by Taylor Swift Society","tickets":"500","booked_ticket":102,"checked_id":0},{"id":"272","event":"Taylor Tuesday - The Era's of Taylor","tickets":"1000","booked_ticket":19,"checked_id":0},{"id":"325","event":"Taylor Tuesday - Committee Only","tickets":"05","booked_ticket":4,"checked_id":0},{"id":"355","event":"UWE Cricket committee only","tickets":"05","booked_ticket":0,"checked_id":0}],"total":{"sold":125,"checkedin":0}}}
/// status : true

ResponsesTotle responsesTotleFromJson(String str) => ResponsesTotle.fromJson(json.decode(str));
String responsesTotleToJson(ResponsesTotle data) => json.encode(data.toJson());
class ResponsesTotle {
  ResponsesTotle({
      bool login,
      Data data,
      bool status,}){
    _login = login;
    _data = data;
    _status = status;
}

  ResponsesTotle.fromJson(dynamic json) {
    _login = json['login'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
  }
  bool _login;
  Data _data;
  bool _status;
ResponsesTotle copyWith({  bool login,
  Data data,
  bool status,
}) => ResponsesTotle(  login: login ?? _login,
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

/// iTotalRecords : 3
/// aaData : {"table":{"total":"05","booked":"00","checked_id":"0"},"events":[{"id":"232","event":"Taylor Tuesdays hosted by Taylor Swift Society","tickets":"500","booked_ticket":102,"checked_id":0},{"id":"272","event":"Taylor Tuesday - The Era's of Taylor","tickets":"1000","booked_ticket":19,"checked_id":0},{"id":"325","event":"Taylor Tuesday - Committee Only","tickets":"05","booked_ticket":4,"checked_id":0},{"id":"355","event":"UWE Cricket committee only","tickets":"05","booked_ticket":0,"checked_id":0}],"total":{"sold":125,"checkedin":0}}

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

/// table : {"total":"05","booked":"00","checked_id":"0"}
/// events : [{"id":"232","event":"Taylor Tuesdays hosted by Taylor Swift Society","tickets":"500","booked_ticket":102,"checked_id":0},{"id":"272","event":"Taylor Tuesday - The Era's of Taylor","tickets":"1000","booked_ticket":19,"checked_id":0},{"id":"325","event":"Taylor Tuesday - Committee Only","tickets":"05","booked_ticket":4,"checked_id":0},{"id":"355","event":"UWE Cricket committee only","tickets":"05","booked_ticket":0,"checked_id":0}]
/// total : {"sold":125,"checkedin":0}

AaData aaDataFromJson(String str) => AaData.fromJson(json.decode(str));
String aaDataToJson(AaData data) => json.encode(data.toJson());
class AaData {
  AaData({
      Table table,
      List<Events> events,
      Total total,}){
    _table = table;
    _events = events;
    _total = total;
}

  AaData.fromJson(dynamic json) {
    _table = json['table'] != null ? Table.fromJson(json['table']) : null;
    if (json['events'] != null) {
      _events = [];
      json['events'].forEach((v) {
        _events?.add(Events.fromJson(v));
      });
    }
    _total = json['total'] != null ? Total.fromJson(json['total']) : null;
  }
  Table _table;
  List<Events> _events;
  Total _total;
AaData copyWith({  Table table,
  List<Events> events,
  Total total,
}) => AaData(  table: table ?? _table,
  events: events ?? _events,
  total: total ?? _total,
);
  Table get table => _table;
  List<Events> get events => _events;
  Total get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_table != null) {
      map['table'] = _table?.toJson();
    }
    if (_events != null) {
      map['events'] = _events?.map((v) => v.toJson()).toList();
    }
    if (_total != null) {
      map['total'] = _total?.toJson();
    }
    return map;
  }

}

/// sold : 125
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

/// id : "232"
/// event : "Taylor Tuesdays hosted by Taylor Swift Society"
/// tickets : "500"
/// booked_ticket : 102
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

/// total : "05"
/// booked : "00"
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