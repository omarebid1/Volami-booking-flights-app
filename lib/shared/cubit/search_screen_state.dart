part of 'search_screen_cubit.dart';

@immutable
sealed class SearchScreenState {}

final class SearchScreenInitial extends SearchScreenState {}

class SearchScreenChangeFlightTypeState extends SearchScreenState {}

class SearchScreenChangeClassState extends SearchScreenState {}


