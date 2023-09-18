import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class FirebaseStorageManager {
  static Future<dynamic> getDataFromStorage(String storagePath) async {
    final storage = FirebaseStorage.instance.ref();
    final jsonRef = storage.child(storagePath);
    final url = await jsonRef.getDownloadURL();
    final jsonUrl = await http.get(Uri.parse(url));

    try {
      if (jsonUrl.statusCode == 200) {
        final jsonString = utf8.decode(jsonUrl.bodyBytes);
        return jsonString;
      }
    } catch (e) {
      return ArgumentError(e);
    }
  }
}
