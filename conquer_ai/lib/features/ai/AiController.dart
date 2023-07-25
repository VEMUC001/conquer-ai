import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show StateNotifier, StateNotifierProvider;

import 'package:conquer_ai/apis/chatgpt_api.dart'
    show ChatGPTAPI, openAIProvider;

final aiControllerProvider = StateNotifierProvider<AiController, bool>((ref) {
  return AiController(
    chatGPTAPI: ref.watch(openAIProvider),
  );
});

class AiController extends StateNotifier<bool> {
  final ChatGPTAPI _chatGPTAPI;

  AiController({required ChatGPTAPI chatGPTAPI})
      : _chatGPTAPI = chatGPTAPI,
        super(false);

  void getAIResponse({required String prompt}) async {
    state = true;
    final result = await _chatGPTAPI.getAIResponse(message: prompt);
    state = false;
    result.fold(
      (failure) => debugPrint(failure.message),
      (String generatedSteps) {
        debugPrint(generatedSteps);
      },
    );
  }

  // void showSnackBar(BuildContext context, String content) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(content),
  //     ),
  //   );
  // }
}
