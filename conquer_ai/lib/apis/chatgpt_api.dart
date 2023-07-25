import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import 'package:conquer_ai/core/type_defs.dart';

import '../constants/appwrite_constants.dart';
import '../core/failure.dart';

final openAIProvider = Provider((ref) {
  return ChatGPTAPI();
});

abstract class IChatGPTAPI {
  FutureEither<String> getAIResponse({required String message});
}

class ChatGPTAPI implements IChatGPTAPI {
  @override
  FutureEither<String> getAIResponse({required String message}) async {
    var generatedSteps = "";

    try {
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${AppwriteConstants.openAIApiKey}',
      };

      var data = jsonEncode({
        "prompt": message,
        "max_tokens": 150,
        "temperature": 0.7,
        "stop": "\n"
      });

      var response = await http.post(Uri.parse(AppwriteConstants.openAIUrl),
          headers: headers, body: data);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        generatedSteps = jsonResponse['choices'][0]['text'];
        return right(generatedSteps);
      } else {
        return left(
          const Failure('Some unexpected error occurred', StackTrace.empty),
        );
      }
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }
}
