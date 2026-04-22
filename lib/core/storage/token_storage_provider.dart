import 'package:kiedys_dojade/core/storage/secure_token_storage.dart';
import 'package:kiedys_dojade/core/storage/token_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_storage_provider.g.dart';

@riverpod
TokenStorage tokenStorage(Ref ref) => SecureTokenStorage();
