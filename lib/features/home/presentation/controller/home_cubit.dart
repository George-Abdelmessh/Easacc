import 'package:easacc/features/home/presentation/view/screens/webview_screen.dart';
import 'package:easacc/features/settings/presentation/view/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  

  int currentView = 0;
  List<Widget> views = [
    const WebviewScreen(),
    const SettingsScreen(),
  ];

  void changeView(int index) {
    currentView = index;
    emit(HomeChangeViewState());
  }
}