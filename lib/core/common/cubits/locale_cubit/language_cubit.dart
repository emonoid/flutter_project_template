import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/local_data/shared_preference_helper.dart';

@immutable
abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object> get props => [];
}

class LanguageLoading extends LanguageState {}

class LanguageLoaded extends LanguageState {
  final Locale locale;

  const LanguageLoaded(this.locale);

  @override
  List<Object> get props => [locale];
}

class LanguageCubit extends Cubit<LanguageState> {
  final LocalData _prefs;

  LanguageCubit(this._prefs) : super(LanguageLoading()) {
    _loadLocale();
  }

  void _loadLocale() async {
    final locale = Locale(await _prefs.getLocale());
    emit(LanguageLoaded(locale));
  }

  void changeLanguage(Locale locale) async {
    _prefs.setLocale(locale.languageCode);
    emit(LanguageLoaded(locale));
  }

  Future<Locale> get getLocal async {
    return Locale(await _prefs.getLocale());
  }
}
