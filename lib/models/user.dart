class User{
  int? userId;
  final String email;
  final String password;

  User({
    required this.email,
    required this.password,
});

  Map<String, String> toMap(){
    return{
      'email': email,
      'password': password
    };
  }

  dynamic get(String propertyName) {
    var _mapRep = toMap();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('User Get Property not found');
  }

}