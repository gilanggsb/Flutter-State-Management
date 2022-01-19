class UserModel {
  final String token;
  const UserModel({required this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        'token': token,
      };
}
