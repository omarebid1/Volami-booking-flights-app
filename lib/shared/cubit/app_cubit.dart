import 'package:air_plane/modules/profile_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/home_screen_module.dart';
import '../../modules/search_screen_module.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  int screenIndex = 0;
  List<Widget> currentScreen = [
    SearchScreenModule(),
    HomeScreenModule(),
    ProfileScreen(),
  ];

  static AppCubit get(context) => BlocProvider.of(context);

  void changeScreenIndex({required int index}) {
    screenIndex = index;
    emit(ChangeScreenState());
  }
}
