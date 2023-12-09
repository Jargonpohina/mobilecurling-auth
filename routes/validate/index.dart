// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../main.dart';

Future<Response> onRequest(RequestContext context) async {
  final data = await context.request.body();
  final map = jsonDecode(data).first;
  final user = map['username'] as String?;
  if (user != null) {
    final username = storage.get<String?>(user);
    if (username != null) {
      return Response(body: 'User validated');
    }
  }
  return Response(statusCode: HttpStatus.unauthorized, body: 'Validate unsuccesful');
}
