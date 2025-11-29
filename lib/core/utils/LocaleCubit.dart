import "package:bloc/bloc.dart" show Cubit;
import 'package:flutter/material.dart';

class LocaleState {
  final Locale locale;

  const LocaleState(this.locale);
}

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit()
      : super(const LocaleState(Locale('ar'))); // default

  void setArabic() => emit(const LocaleState(Locale('ar')));

  void setEnglish() => emit(const LocaleState(Locale('en')));

  void setLocale(Locale locale) => emit(LocaleState(locale));
}
