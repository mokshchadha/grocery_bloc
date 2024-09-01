part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

// state are of 2 types home state and action state, and we have this difference to even further control the rendering of the screen

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

// probable examples of home action state

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}
