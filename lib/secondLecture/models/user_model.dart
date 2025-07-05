

class User {
  int id;
  String email;
  String username;
  String password;
  String city;
  User(this.id, this.email, this.username,this.password,this.city);
  factory User.toMap(Map<String, dynamic> map) {
    String city=map['address']['city'];
    return User(map['id'], map['email'], map['username'],map['password'],city);
  }
}
