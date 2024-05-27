class User {
  final String? uid;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final List<String>? bookings;

  User(
      {this.uid,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.password,
      this.bookings});

/*factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      firstName: ['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phone: json['phone'],
      bookings: List<String>.from(json['bookings']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': lastName,
      'email': email,
      'phone': phone,
      'bookings': bookings,
    };
  }*/
}
