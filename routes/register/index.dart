// ignore_for_file: avoid_dynamic_calls, lines_longer_than_80_chars
import 'package:crypto/crypto.dart';

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
    if (RegExp('[0-9a-zA-Z]').hasMatch(user.username) && user.username.length > 2 && RegExp('[0-9a-zA-Z]').hasMatch(user.password) && user.password.length > 2) {
      final key = utf8.encode(user.password);
      final passwordEncrypted = Hmac(sha256, key).convert(key);
      storage.set(user.username, jsonEncode(user.copyWith(password: passwordEncrypted.toString()).toJson()));
      return Response(body: 'Register succesful');
    }
    return Response(statusCode: HttpStatus.unauthorized, body: 'Register unsuccesful');
  } catch (e) {
    return Response(statusCode: HttpStatus.badRequest, body: 'Register unsuccesful');
  }
}
