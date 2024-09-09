import 'package:bloc/bloc.dart';

import 'states_language.dart';

class LanguageCubit extends Cubit<String>{
  LanguageCubit():super('en');

  void toEnglish() {
    emit('en');
  }

  void toArabic() {
    emit('ar');
  }

  }
