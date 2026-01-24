part of 'navigation_cubit.dart';

enum NavigationStatus { home, maps, history, rewards, profile }

@immutable
class NavigationState {
  final NavigationStatus status;
  const NavigationState({required this.status});
  factory NavigationState.home() {
    return const NavigationState(status: NavigationStatus.home);
  }
  NavigationState copyWith({NavigationStatus? status}) {
    return NavigationState(status: status ?? this.status);
  }
}
