class Flight {
  final String flightId;
  final String airline;
  final String origin;
  final String destination;
  final String departureTime;
  final String arrivalTime;
  final double price;
  final int availableSeats;

  Flight(
      {required this.flightId,
      required this.airline,
      required this.origin,
      required this.destination,
      required this.departureTime,
      required this.arrivalTime,
      required this.price,
      required this.availableSeats});

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      flightId: json['flightId'],
      airline: json['airline'],
      origin: json['origin'],
      destination: json['destination'],
      departureTime: json['departureTime'],
      arrivalTime: json['arrivalTime'],
      price: json['price'],
      availableSeats: json['availableSeats'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flightId': flightId,
      'airline': airline,
      'origin': origin,
      'destination': destination,
      'departureTime': departureTime,
      'arrivalTime': arrivalTime,
      'price': price,
      'availableSeats': availableSeats,
    };
  }
}
