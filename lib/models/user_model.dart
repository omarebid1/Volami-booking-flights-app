class User {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final List<String> bookings;

  User(
      {required this.uid,
      required this.name,
      required this.email,
      required this.phone,
      required this.bookings});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      bookings: List<String>.from(json['bookings']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'bookings': bookings,
    };
  }
}
