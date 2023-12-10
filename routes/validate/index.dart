// ignore_for_file: avoid_dynamic_calls, lines_longer_than_80_chars

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
    final fetchUser = User.fromJson(jsonDecode(storage.get<String?>(user.username)!) as Map<String, Object?>);
    if (user == fetchUser) {
      return Response(body: 'Validated succesfully');
    } else {
      return Response(statusCode: HttpStatus.unauthorized, body: 'Validate unsuccesful');
    }
  } catch (e) {
    return Response(statusCode: HttpStatus.unauthorized, body: 'Validate unsuccesful');
  }
}
