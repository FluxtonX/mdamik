import '../../../core/mvvm/base_view_model.dart';

class AuthOtpViewModel extends BaseViewModel {
  String code = '';

  bool get canSubmit => code.trim().length >= 4;

  void onCodeChanged(String v) {
    code = v;
    notifyListeners();
  }

  void resend() {
    // UI-only for now.
  }
}

