class User{
  int? userId;
  final String username;
  final String password;

  User({
    required this.username,
    required this.password,
});

  Map<String, dynamic> toMap(){
    return{
      'username': username,
      'password': password
    };
  }
}