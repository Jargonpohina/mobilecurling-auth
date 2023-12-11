// ignore_for_file: avoid_dynamic_calls, lines_longer_than_80_chars
import 'package:encrypt/encrypt.dart';

import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mobilecurling_auth/core/shared_classes/user/user.dart';

import '../../main.dart';

Future<Response> onRequest(RequestContext context) async {
  try {
    final data = await context.request.body();
    final map = jsonDecode(data) as Map<String, Object?>;
    final user = User.fromJson(map);
    final plainPassword = user.password;
    if (user.username.length > 2 && user.password.length > 2) {
      final key = Key.fromUtf8(plainPassword);
      final iv = IV.fromLength(16);
      final encrypter = Encrypter(AES(key));
      final passowrdEncrypted = encrypter.encrypt(plainPassword, iv: iv);
      storage.set(user.username, jsonEncode(user.copyWith(password: passowrdEncrypted.base64).toJson()));
      return Response(body: 'Register succesful');
    }
    return Response(statusCode: HttpStatus.unauthorized, body: 'Register unsuccesful');
  } catch (e) {
    return Response(statusCode: HttpStatus.unauthorized, body: 'Register unsuccesful');
  }
}
