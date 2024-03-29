part of 'intro_cubit.dart';

@immutable
sealed class IntroState extends Equatable {
  const IntroState();

  @override
  List<Object?> get props => [];
}

class IntroFirstPage extends IntroState {}

class IntroLastPage extends IntroState {}

class IntroLoaded extends IntroState {}
