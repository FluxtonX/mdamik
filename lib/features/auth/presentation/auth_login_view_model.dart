import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/mvvm/base_view_model.dart';
import '../../../core/network/api_client.dart';

class AuthLoginViewModel extends BaseViewModel {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();

  bool isLogin = true;
  bool useEmail = true;
  bool isLoading = false;

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

  Future<String?> signIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      return 'Please fill in all fields';
    }

    isLoading = true;
    notifyListeners();

    try {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        // Sync login verification with backend
        final response = await _apiClient.post('/auth/login', body: {
          'firebaseUid': firebaseUser.uid,
        });

        if (!response.success) {
          // If backend user is not found, automatically register them
          if (response.message.toLowerCase().contains('not found')) {
            final registerResponse = await _apiClient.post('/auth/register', body: {
              'fullName': firebaseUser.displayName ?? 'New User',
              'email': firebaseUser.email ?? email,
              'phoneNumber': firebaseUser.phoneNumber ?? '',
              'firebaseUid': firebaseUser.uid,
              'profileRole': 'Client / Owner',
            });
            if (!registerResponse.success) {
              debugPrint('Backend auto-registration on login failed: ${registerResponse.message}');
              await FirebaseAuth.instance.signOut();
              return 'Local server is unreachable or offline. Please make sure the backend is running.';
            }
          } else {
             debugPrint('Backend login verification failed: ${response.message}');
             await FirebaseAuth.instance.signOut();
             return 'Local server is unreachable or offline. Please make sure the backend is running.';
          }
        }
      }

      isLoading = false;
      notifyListeners();
      return null; // Success
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      notifyListeners();
      return e.message ?? 'An unknown error occurred';
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return e.toString();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

