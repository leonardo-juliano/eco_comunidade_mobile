class User { 
  final String? name;
  final String? email;
  final String? password;
  final String? phone;


  User({ this.name, this.email, this.password, this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}