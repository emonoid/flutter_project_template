import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../local_data/shared_preference_helper.dart';
import '../../../utils/enums.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final LocalData _prefs;
  ThemeCubit(this._prefs) : super(ThemeLoading()) {
    _loadTheme();
  }

  void _loadTheme() async {
    String theme = await _prefs.getTheme();
    emit(ThemeLoaded(theme == 'light' ? ThemeModes.light : ThemeModes.dark));
  }

  void changeTheme(ThemeModes theme) {
    _prefs.setTheme(theme.name);
    emit(ThemeLoaded(theme));
  }

  Future<ThemeModes> get getTheme async {
    String theme = await _prefs.getTheme();
    return theme == 'light' ? ThemeModes.light : ThemeModes.dark;
  }
}
