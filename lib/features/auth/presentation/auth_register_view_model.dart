import '../../../core/mvvm/base_view_model.dart';

class AuthRegisterViewModel extends BaseViewModel {
  bool isLogin = false;

  void selectLogin() {
    if (isLogin) return;
    isLogin = true;
    notifyListeners();
  }

  void selectSignUp() {
    if (!isLogin) return;
    isLogin = false;
    notifyListeners();
  }
}

