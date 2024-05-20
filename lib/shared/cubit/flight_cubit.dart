import 'package:bloc/bloc.dart';

import '../../models/flight_model.dart';
import '../../repository/flight_repository.dart';

part 'flight_state.dart';

class FlightsCubit extends Cubit<FlightsState> {
  final FlightRepository _flightRepository;

  FlightsCubit(this._flightRepository) : super(FlightsInitial());

  Future<void> fetchFlights() async {
    try {
      emit(FlightsLoading());
      List<Flight> flights = await _flightRepository.getFlights();
      emit(FlightsLoaded(flights));
    } catch (e) {
      emit(FlightsError(e.toString()));
    }
  }
}
