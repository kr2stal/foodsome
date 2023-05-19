import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:crypto/crypto.dart';

import '../../services/account/login_service.dart';

final loginNotifyProvider = StateNotifierProvider<LoginNotifier, String>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<String> {
  LoginNotifier(this.ref) : super('');
  final Ref ref;

  login({id, pw}) async {
    var digestPassword = sha256.convert(utf8.encode(pw)).toString();
    var result = await ref.read(loginService).getLoginResult(param: {'username': id, 'password': digestPassword});

    return state = result!;
  }

  refresh() => state = '';
}
