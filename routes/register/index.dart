// ignore_for_file: avoid_dynamic_calls

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
    storage.set(user.username, jsonEncode(user.toJson()));
    return Response(body: 'Register succesful');
  } catch (e) {
    return Response(statusCode: HttpStatus.unauthorized, body: 'Register unsuccesful');
  }
}
