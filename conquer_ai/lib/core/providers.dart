import 'package:appwrite/appwrite.dart';
import 'package:conquer_ai/constants/appwrite_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appWriteClientProvider = Provider(
  (ref) {
    return Client()
        .setEndpoint(AppwriteConstants.endPoint)
        .setProject(AppwriteConstants.projectId)
        .setSelfSigned(status: true);
  },
);

final appwriteAccountProvider = Provider(
  (ref) {
    return Account(ref.watch(appWriteClientProvider));
  },
);
