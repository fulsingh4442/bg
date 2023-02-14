import 'dart:convert';
/// error : ""
/// status : true
/// data : [{"id":"1","name":"Beach Bar","slug":"beach-bar","logo":null},{"id":"2","name":"Zoh","slug":"zoh","logo":"https://reserveyourvenue.s3.amazonaws.com/bg/uploads/venues/1670854677.png"}]

VenuesResponsr venuesResponsrFromJson(String str) => VenuesResponsr.fromJson(json.decode(str));
String venuesResponsrToJson(VenuesResponsr data) => json.encode(data.toJson());
class VenuesResponsr {
  VenuesResponsr({
      String error,
      bool status,
      List<Data> data,}){
    _error = error;
    _status = status;
    _data = data;
}

  VenuesResponsr.fromJson(dynamic json) {
    _error = json['error'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String _error;
  bool _status;
  List<Data> _data;
VenuesResponsr copyWith({  String error,
  bool status,
  List<Data> data,
}) => VenuesResponsr(  error: error ?? _error,
  status: status ?? _status,
  data: data ?? _data,
);
  String get error => _error;
  bool get status => _status;
  List<Data> get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// name : "Beach Bar"
/// slug : "beach-bar"
/// logo : null

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String id,
      String name,
      String slug,
      dynamic logo,}){
    _id = id;
    _name = name;
    _slug = slug;
    _logo = logo;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _logo = json['logo'];
  }
  String _id;
  String _name;
  String _slug;
  dynamic _logo;
Data copyWith({  String id,
  String name,
  String slug,
  dynamic logo,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  slug: slug ?? _slug,
  logo: logo ?? _logo,
);
  String get id => _id;
  String get name => _name;
  String get slug => _slug;
  dynamic get logo => _logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['logo'] = _logo;
    return map;
  }

}