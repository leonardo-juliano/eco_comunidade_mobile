class User { 
  late final String? name;
  late final String? email;
  late final String? password;
  late final String? phone;


  User({ this.name, this.email, this.password, this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
    );
  }

  set senha(String? senha) {}

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}