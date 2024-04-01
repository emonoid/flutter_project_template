part of 'theme_cubit.dart';

@immutable
abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeLoading extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final ThemeModes theme;

  const ThemeLoaded(this.theme);

  @override
  List<Object> get props => [theme];
}
