part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final Widget page;

  HomeSuccess(this.page);
}

final class HomeError extends HomeState {
  final String errorMessage;

  HomeError({required this.errorMessage});
}
