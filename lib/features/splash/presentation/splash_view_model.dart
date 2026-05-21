import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/mvvm/base_view_model.dart';
import '../../../core/network/api_client.dart';

class SplashViewModel extends BaseViewModel {
  Timer? _timer;
  final ApiClient _apiClient = ApiClient();
  bool _backendConnected = true;

  bool get isUserLoggedIn => FirebaseAuth.instance.currentUser != null && _backendConnected;

  Future<void> init() async {
    if (FirebaseAuth.instance.currentUser != null) {
      final response = await _apiClient.get('/user/profile');
      if (!response.success) {
        _backendConnected = false;
        await FirebaseAuth.instance.signOut();
      }
    }
  }

  void startCountdown({
    required Duration duration,
    required VoidCallback onDone,
  }) {
    _timer?.cancel();
    _timer = Timer(duration, onDone);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

