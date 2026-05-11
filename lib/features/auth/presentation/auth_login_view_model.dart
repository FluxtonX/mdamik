import '../../../core/mvvm/base_view_model.dart';

class AuthLoginViewModel extends BaseViewModel {
  bool isLogin = true;
  bool useEmail = true;

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

  void setUseEmail(bool value) {
    if (useEmail == value) return;
    useEmail = value;
    notifyListeners();
  }
}

