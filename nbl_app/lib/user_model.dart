class User{
  String? id;
  String firstName;
  String lastName;
  String email;
  String password;
  String designation;

  User({required this.firstName, required this.lastName, required this.email, required this.password, required this.designation, required id});

  factory User.fromMap(Map<String,dynamic> map){
    return User(
      id: map['id'],
      firstName: map['firstName'], 
      lastName: map['lastName'], 
      email: map['email'], 
      password: map['password'], 
      designation: map['designation'],
    );
  }
  
  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'designation': designation,
    };
  }
}