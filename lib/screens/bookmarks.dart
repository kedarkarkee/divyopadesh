import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../providers/language.dart';
import '../widgets/verse.dart';
import '../providers/bookmarks.dart';

class Bookmarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: Consumer<BookmarkManager>(builder: (context, bookmarkManager, _) {
        final items = bookmarkManager.bookmarks;
        if (items.length == 0) {
          return Center(
            child: const Text("Bookmarks Empty"),
          );
        }
        return ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, i) {
              final item = items[i];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) async {
                  items.removeAt(i);
                  await bookmarkManager
                      .deleteBookmark(item.chapter, item.verse)
                      .then((_) {
                    Scaffold.of(ctx).removeCurrentSnackBar();
                    Scaffold.of(ctx).showSnackBar(SnackBar(
                      content: const Text('Verse Removed from Bookmarks'),
                      behavior: SnackBarBehavior.floating,
                    ));
                  });
                },
                child: Verse(
                  geeta: item,
                  fontSize: 18,
                  textColor: Colors.white,
                ),
                background: Container(
                  padding: const EdgeInsets.only(
                    right: 12,
                  ),
                  alignment: Alignment.centerLeft,
                  color: Colors.red,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                secondaryBackground: Container(
                  padding: const EdgeInsets.only(
                    right: 12,
                  ),
                  alignment: Alignment.centerRight,
                  color: Colors.red,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
