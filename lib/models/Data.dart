class Data {
  Data(data, {

      this.id, 
      this.username, 
      this.email, 
      this.role, 
      this.name, 
      this.token, 
      this.loginTime,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    name = json['name'];
    token = json['token'];
    loginTime = json['login_time'];
  }
  int id;
  String username;
  String email;
  int role;
  String name;
  String token;
  String loginTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['role'] = role;
    map['name'] = name;
    map['token'] = token;
    map['login_time'] = loginTime;
    return map;
  }

}