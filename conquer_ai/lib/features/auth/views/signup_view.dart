import 'package:conquer_ai/common/loading_page.dart';
import 'package:conquer_ai/common/rounded_small_button.dart';
import 'package:conquer_ai/features/auth/views/login_view.dart';
import 'package:conquer_ai/features/auth/widgets/auth_text_field.dart';
import 'package:conquer_ai/theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:conquer_ai/constants/constants.dart';
import 'package:lottie/lottie.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final appbar = UIConstants.appBarNoTitle();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onSignUp() {
    // ref.read(authControllerProvider.notifier).signUp(
    //       email: emailController.text,
    //       password: passwordController.text,
    //       context: context,
    //     );
  }

  @override
  Widget build(BuildContext context) {
    // final isLoading = ref.watch(authControllerProvider);
    final isLoading = false;

    return Scaffold(
      appBar: appbar,
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // textfield 1
                    buildLottieView(),
                    const SizedBox(height: 12),
                    AuthField(
                      controller: nameController,
                      hintText: 'Name',
                    ),
                    const SizedBox(height: 12),
                    AuthField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      hintText: 'Email',
                    ),
                    const SizedBox(height: 16),
                    AuthField(
                      obscureText: true,
                      controller: passwordController,
                      hintText: 'Password',
                    ),
                    const SizedBox(height: 24),
                    Align(
                      alignment: Alignment.topRight,
                      child: RoundedSmallButton(
                        onTap: onSignUp,
                        label: 'Register',
                      ),
                    ),
                    const SizedBox(height: 24),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account?",
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        children: [
                          TextSpan(
                            text: ' Login',
                            style: const TextStyle(
                              color: Pallete.blueColor,
                              fontSize: 14,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  LoginView.route(),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildLottieView() {
    return Lottie.asset(
      AssetsConstants.registrationLottiePath,
      width: MediaQuery.of(context).size.width * 0.5,
      height: 200,
      repeat: false,
    );
  }
}
