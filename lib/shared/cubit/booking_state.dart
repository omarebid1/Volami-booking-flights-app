part of 'booking_cubit.dart';

abstract class BookingsState {}

class BookingsInitial extends BookingsState {}

class BookingsLoading extends BookingsState {}

class BookingsLoaded extends BookingsState {
  final List<Booking> bookings;

  BookingsLoaded(this.bookings);
}

class BookingsError extends BookingsState {
  final String message;

  BookingsError(this.message);
}
