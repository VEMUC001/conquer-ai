import 'package:conquer_ai/apis/auth_api.dart';
import 'package:conquer_ai/features/auth/views/login_view.dart';
import 'package:conquer_ai/features/auth/views/signup_view.dart';
import 'package:conquer_ai/features/home/view%20/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appwrite/models.dart' as model;

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authApi: ref.watch(authApiProvider),
  );
});

class AuthController extends StateNotifier<bool> {
  final AuthApi _authAPI;

  AuthController({required AuthApi authApi})
      : _authAPI = authApi,
        super(false);

  Future<model.Account?> currentUser() => _authAPI.currentUserAccount();

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final result = await _authAPI.login(email: email, password: password);
    state = false;
    result.fold(
      (failure) => showSnackBar(context, failure.message),
      (session) {
        //TOFIX: this needs to navigate to the home screen
        Navigator.pushReplacement(context, HomeView.route());
      },
    );
  }

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final result = await _authAPI.signUp(email: email, password: password);
    state = false;
    result.fold(
      (failure) => showSnackBar(context, failure.message),
      (account) {
        //TOFIX: this needs to navigate to the home screen and save the account to the userModel
        Navigator.pushReplacement(context, LoginView.route());
      },
    );
  }

  void logout(BuildContext context) async {
    final result = await _authAPI.logout();
    result.fold(
      (failure) => debugPrint(failure.message),
      (_) {
        Navigator.pushAndRemoveUntil(
          context,
          SignUpView.route(),
          (route) => false,
        );
      },
    );
  }
}

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
