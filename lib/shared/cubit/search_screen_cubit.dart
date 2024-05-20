import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  int selectedFlightType = 1; //  OneWay or RoundTrip
  String selectedClass = 'economy';
  TextEditingController departureController = TextEditingController();
  var returnController = TextEditingController();
  final List<String> items = ['Business class', 'economy'];

  SearchScreenCubit() : super(SearchScreenInitial());

  static SearchScreenCubit get(context) => BlocProvider.of(context);

  void changeFlightType({required int selectedFlightType}) {
    this.selectedFlightType = selectedFlightType;
    emit(SearchScreenChangeFlightTypeState());
  }

  void changeClassType({required String selectedClass}) {
    this.selectedClass = selectedClass;
    emit(SearchScreenChangeClassState());
  }
}
