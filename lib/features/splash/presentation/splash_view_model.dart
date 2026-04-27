import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../core/mvvm/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  Timer? _timer;

  Future<void> init() async {
    // Later: preload config, auth state, etc.
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

