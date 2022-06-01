final String tableLogin = 'login';
class login_fields {
  static final List<String> values = [
    //Add all fields
    id, name, email, password,
  ];
  static final String id = '_id';
  static final String name = 'name';
  static final String email = 'email';
  static final String password = 'password';
}

class Login {
  int id;
  String name;
  String password;
  String email;
  Login({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  Map<String, Object> toJson() => {
        login_fields.id: id,
        login_fields.name: name,
        login_fields.email: email,
        login_fields.password: password,
      };
  Login copy({
    int id,
    String name,
    String email,
    String password,
  }) =>
      Login(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  static Login fromJson(Map<String, Object> json) => Login(
        id: json[login_fields.id] as int,
        name: json[login_fields.name] as String,
        email: json[login_fields.email] as String,
        password: json[login_fields.password] as String,
      );

}
