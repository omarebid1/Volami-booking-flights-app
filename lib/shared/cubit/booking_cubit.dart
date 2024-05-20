import 'package:bloc/bloc.dart';

import '../../models/booking_model.dart';
import '../../repository/booking_repository.dart';

part 'booking_state.dart';

class BookingsCubit extends Cubit<BookingsState> {
  final BookingRepository _bookingRepository;

  BookingsCubit(this._bookingRepository) : super(BookingsInitial());

  Future<void> fetchBookings(String userId) async {
    try {
      emit(BookingsLoading());
      List<Booking> bookings =
          await _bookingRepository.getBookingsByUser(userId);
      emit(BookingsLoaded(bookings));
    } catch (e) {
      emit(BookingsError(e.toString()));
    }
  }
}
