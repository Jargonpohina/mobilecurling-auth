import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:tiny_storage/tiny_storage.dart';

late TinyStorage storage;

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  storage = await TinyStorage.init('passwords.txt', path: './');
  return serve(handler, ip, 8081);
}
