import '../../../core/mvvm/base_view_model.dart';

class ChooseLanguageViewModel extends BaseViewModel {
  int selectedLanguageIndex = 0;

  void selectLanguage(int index) {
    if (selectedLanguageIndex == index) return;
    selectedLanguageIndex = index;
    notifyListeners();
  }
}
