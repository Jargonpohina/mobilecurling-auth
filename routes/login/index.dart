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
    final fetchPassword = storage.get<String?>(user);
    if (password == fetchPassword) {
      return Response(body: 'Login succesful');
    }
  }
  return Response(statusCode: HttpStatus.unauthorized, body: 'Login unsuccesful');
}
