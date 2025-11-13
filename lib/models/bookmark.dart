import '../models/content_List.dart';
import '../models/bookmark_io.dart';

//This is how bookmarks are manage within the app
class PinBookmarks {
  BookmarkStorage storage = BookmarkStorage();
  List<ContentLi> bookmarks = [];

  Future<List<ContentLi>> readAllBookmarks() async {
    bookmarks = await storage.readBookmarks();
    return bookmarks;
  }

  Future addBookmark(ContentLi cl) async {
    if (!bookmarks.any((conL) => conL.id == cl.id)) {
      bookmarks.add(cl);
      await storage.writeBookmarks(bookmarks);
    }
  }

  Future removeBookmark(ContentLi cl) async {
    bookmarks.removeWhere((conL) => conL.id == cl.id);
    await storage.writeBookmarks(bookmarks);
  }

  bool isBookmark(ContentLi cl) {
    return bookmarks.any((conL) => conL.id == cl.id);
  }
}
