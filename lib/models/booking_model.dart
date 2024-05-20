class Booking {
  final String bookingId;
  final String userId;
  final String flightId;
  final String bookingTime;
  final String status;

  Booking(
      {required this.bookingId,
      required this.userId,
      required this.flightId,
      required this.bookingTime,
      required this.status});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingId: json['bookingId'],
      userId: json['userId'],
      flightId: json['flightId'],
      bookingTime: json['bookingTime'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'userId': userId,
      'flightId': flightId,
      'bookingTime': bookingTime,
      'status': status,
    };
  }
}
