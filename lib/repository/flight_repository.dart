import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/flight_model.dart';

class FlightRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addFlight(Flight flight) {
    return _firestore
        .collection('flights')
        .doc(flight.flightId)
        .set(flight.toJson());
  }

  Future<List<Flight>> getFlights() async {
    QuerySnapshot snapshot = await _firestore.collection('flights').get();
    return snapshot.docs
        .map((doc) => Flight.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
