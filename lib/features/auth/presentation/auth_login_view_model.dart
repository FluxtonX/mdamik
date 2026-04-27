import '../../../core/mvvm/base_view_model.dart';

class AuthLoginViewModel extends BaseViewModel {
  bool isLogin = true;

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

