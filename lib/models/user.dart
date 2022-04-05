class User{
  final int userId;
  final String username;
  final String password;

  const User({
    required this.userId,
    required this.username,
    required this.password
});

  Map<String, dynamic> toMap(){
    return{
      'userId': userId,
      'username': username,
      'password': password;
    };
  }
}