import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(status: NavigationStatus.home));

  void selectedTap(NavigationStatus tap) {
    emit(state.copyWith(status: tap));
  }

  void selectByIndex(int index) {
    emit(state.copyWith(status: _statusFromIndex(index)));
  }

  NavigationStatus _statusFromIndex(int index) {
    switch (index) {
      case 0:
        return NavigationStatus.history;
      case 1:
        return NavigationStatus.maps;
      case 2:
        return NavigationStatus.home;
      case 3:
        return NavigationStatus.rewards;
      case 4:
        return NavigationStatus.profile;
      default:
        return NavigationStatus.home;
    }
  }

  int statusToIndex(NavigationStatus status) {
    switch (status) {
      case NavigationStatus.history:
        return 0;
      case NavigationStatus.maps:
        return 1;
      case NavigationStatus.home:
        return 2;
      case NavigationStatus.rewards:
        return 3;
      case NavigationStatus.profile:
        return 4;
    }
  }
}
