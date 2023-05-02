import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme/theme.dart';

// import 'package:appwrite/appwrite.dart';

// Client client = Client();
// client
//     .setEndpoint('http://localhost/v1')
//     .setProject('64512c5e5a4739e1bc59')
//     .setSelfSigned(status: true); // For self signed certificates, only use for development
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Conquer AI'),
        ),
      ),
    );
  }
}
