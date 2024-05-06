class UserModel {
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;
  String? image;
  String? token;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        gender: json['gender'],
        image: json['image'],
        token: json['token'],
      );
}

class RequestUserModel {
  String userName;
  String password;
  int expiresInMins;

  RequestUserModel({
    required this.userName,
    required this.password,
    required this.expiresInMins,
  });

  factory RequestUserModel.init() => RequestUserModel(
        userName: '',
        password: '',
        expiresInMins: -1,
      );

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'password': password,
      'expiresInMins': 30,
    };
  }
}
