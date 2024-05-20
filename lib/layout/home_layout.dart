import 'package:air_plane/shared/cubit/app_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/cubit/search_screen_cubit.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => SearchScreenCubit()),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: cubit.currentScreen[cubit.screenIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color(0xFF161E36),
              type: BottomNavigationBarType.fixed,
              iconSize: 35,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              onTap: (value) {
                if (kDebugMode) {
                  print(value);
                }
                if (value == 0) {
                  cubit.changeScreenIndex(index: 1);
                } else if (value == 1) {
                  cubit.changeScreenIndex(index: 0);
                } else {
                  cubit.changeScreenIndex(index: 2);
                }
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: '',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
