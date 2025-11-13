import 'dart:convert';
import 'dart:io';
import '../models/content_List.dart';
import 'package:path_provider/path_provider.dart';

//This is the part where actual content list is written into the device
class BookmarkStorage {
  Future get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future get _localFile async {
    final path = await _localPath;
    return File('$path/bookmarks.dat');
  }

  Future writeBookmarks(List bookmarkList) async {
    try {
      final File file = await _localFile;

      String json = jsonEncode(bookmarkList);
      print('JSON writing to file: ' + json);
      await file.writeAsString(json, mode: FileMode.write);
      return true;
    } catch (e) {
      print('error $e');
    }
    return false;
  }

  Future readBookmarks() async {
    try {
      final File file = await _localFile;

      String jsonString = await file.readAsString();
      print('JSON reading to file: ' + jsonString);
      Iterable jsonMap = jsonDecode(jsonString);
      List bmark = jsonMap.map((pJson) => ContentLi.fromJson(pJson)).toList();
      return bmark;
    } catch (e) {
      print('error $e');
    }
    return [];
  }
}
