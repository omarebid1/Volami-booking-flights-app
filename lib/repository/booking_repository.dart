import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/booking_model.dart';

class BookingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addBooking(Booking booking) {
    return _firestore
        .collection('bookings')
        .doc(booking.bookingId)
        .set(booking.toJson());
  }

  Future<List<Booking>> getBookingsByUser(String userId) async {
    QuerySnapshot snapshot = await _firestore
        .collection('bookings')
        .where('userId', isEqualTo: userId)
        .get();
    return snapshot.docs
        .map((doc) => Booking.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
