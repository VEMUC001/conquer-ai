import 'package:conquer_ai/features/auth/views/login_view.dart';
import 'package:conquer_ai/features/home/view%20/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/goals/views/create_goal.dart';
import 'theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Conquer AI',
      theme: AppTheme.theme,
      home: const LoginView(),
    );
  }
}
