import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/mvvm/base_view_model.dart';
import '../../../core/network/api_client.dart';

class AuthRegisterViewModel extends BaseViewModel {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final ApiClient _apiClient = ApiClient();

  bool isLogin = false;
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

  Future<String?> signUp() async {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final phoneNumber = phoneNumberController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      return 'Please fill in all fields';
    }

    isLoading = true;
    notifyListeners();

    try {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        // Sync registration details to backend
        final body = {
          'fullName': fullName.isNotEmpty ? fullName : 'New User',
          'email': email,
          'phoneNumber': phoneNumber.isNotEmpty ? phoneNumber : '',
          'firebaseUid': firebaseUser.uid,
          'profileRole': 'Client / Owner', // default role
        };

        final response = await _apiClient.post('/auth/register', body: body);
        if (!response.success) {
          // If the error message indicates duplicate record/already exists, we can treat it as a success, otherwise log it
          if (response.message.toLowerCase().contains('exists') || response.message.toLowerCase().contains('duplicate')) {
             // Treat as user already registered
          } else {
             debugPrint('Backend registration response: ${response.message}');
             try {
               await firebaseUser.delete();
             } catch (e) {
               await FirebaseAuth.instance.signOut();
             }
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
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

