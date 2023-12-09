// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../main.dart';

Future<Response> onRequest(RequestContext context) async {
  final data = await context.request.body();
  final map = jsonDecode(data).first;
  final user = map['username'] as String?;
  final password = map['password'] as String?;
  if (user != null && password != null) {
    storage.set(user, password);
    return Response(body: 'Register succesful');
  }
  return Response(statusCode: HttpStatus.unauthorized, body: 'Register unsuccesful');
}
