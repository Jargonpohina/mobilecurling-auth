// ignore_for_file: avoid_dynamic_calls, lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dart_frog/dart_frog.dart';
import 'package:encrypt/encrypt.dart';
import 'package:mobilecurling_auth/core/shared_classes/user/user.dart';

import '../../main.dart';

Future<Response> onRequest(RequestContext context) async {
  try {
    final data = await context.request.body();
    final map = jsonDecode(data) as Map<String, Object?>;
    final user = User.fromJson(map);
    final fetchUser = User.fromJson(jsonDecode(storage.get<String?>(user.username)!) as Map<String, Object?>);
    final plainPassword = user.password;
    final key = Key(Uint8List.fromList(user.password.codeUnits));
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final passwordEncrypted = encrypter.encrypt(plainPassword, iv: iv);
    if (passwordEncrypted.base64 == fetchUser.password) {
      return Response(body: jsonEncode(fetchUser.toJson()));
    } else {
      return Response(statusCode: HttpStatus.unauthorized, body: 'Wrong password');
    }
  } catch (e) {
    return Response(statusCode: HttpStatus.unauthorized, body: 'Login unsuccesful');
  }
}
