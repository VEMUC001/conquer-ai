import 'package:conquer_ai/common/loading_page.dart';
import 'package:conquer_ai/common/rounded_small_button.dart';
import 'package:conquer_ai/features/auth/controller/auth_controller.dart';
import 'package:conquer_ai/features/auth/views/signup_view.dart';
import 'package:conquer_ai/features/auth/widgets/auth_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:conquer_ai/constants/constants.dart';
import 'package:conquer_ai/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../widgets/onboarding_image_text_page.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late int selectedPage;
  late final PageController _pageController;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onLogin() {
    ref.read(authControllerProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return buildView(context);
  }

  Widget buildView(BuildContext context) {
    // final appbar = UIConstants.appBar();
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
      // appBar: appbar,
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // textfield 1
                    buildViewPager(),
                    buildPageIndicator(),
                    const SizedBox(height: 32),
                    buildEmailTextField(),
                    const SizedBox(height: 16),
                    buildPasswordTextField(),
                    const SizedBox(height: 16),
                    buildLoginButton(),
                    const SizedBox(height: 16),
                    buildRegistrationTextField(),
                  ],
                ),
              ),
            ),
    );
  }

  RichText buildRegistrationTextField() {
    return RichText(
      text: TextSpan(
        text: "Don't have an account?",
        style: const TextStyle(
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: 'Sign up',
            style: const TextStyle(
              color: Pallete.blueColor,
              fontSize: 14,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  SignUpView.route(),
                );
              },
          ),
        ],
      ),
    );
  }

  Align buildLoginButton() {
    return Align(
      alignment: Alignment.topRight,
      child: RoundedSmallButton(
        onTap: onLogin,
        label: 'Done',
      ),
    );
  }

  Widget buildEmailTextField() {
    return AuthField(
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      hintText: 'Email',
    );
  }

  Widget buildPasswordTextField() {
    return AuthField(
      obscureText: true,
      controller: passwordController,
      hintText: 'Password',
    );
  }

  Widget buildViewPager() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: PageView(
        controller: _pageController,
        pageSnapping: true,
        onPageChanged: (page) {
          setState(
            () {
              selectedPage = page;
            },
          );
        },
        children: const [
          OnboardingPage(
            description: 'Hello there, welcome to Conquer AI.',
            imgFile: AssetsConstants.conquerLottiePath,
          ),
          OnboardingPage(
            description: 'This is the second page. Explore more.',
            imgFile: AssetsConstants.winnerLottiePath,
          ),
          OnboardingPage(
            description: 'Endless possibilities. Let\'s get started.',
            imgFile: AssetsConstants.trophyLottiePath,
          ),
        ],
      ),
    );
  }

  buildPageIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: PageViewDotIndicator(
        currentItem: selectedPage,
        count: 3,
        size: const Size(8, 8),
        unselectedColor: Colors.grey,
        selectedColor: Colors.white,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}
