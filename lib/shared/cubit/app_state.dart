part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}
class ChangeScreenState extends AppState{}
