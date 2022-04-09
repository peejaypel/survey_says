class User{
  int? userId;
  final String emailAddress;
  final String password;

  User({
    required this.emailAddress,
    required this.password,
});

  Map<String, String> toMap(){
    return{
      'username': emailAddress,
      'password': password
    };
  }
}