import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/verse.dart';
import '../providers/search.dart';
import '../models/geeta.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _text = TextEditingController();
  SearchProvider _searchProvider;
  @override
  void dispose() {
    _searchProvider.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _searchProvider = Provider.of<SearchProvider>(context);
    List<Geeta> lists = _searchProvider.lists;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight * 2),
          child: SafeArea(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  Expanded(
                    child: Card(
                      color: Theme.of(context).accentColor,
                      elevation: 5.0,
                      margin: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: _text,
                                onSubmitted: (str) async {
                                  if (str != '') {
                                    await _searchProvider.searchData(str);
                                  }
                                },
                                textInputAction: TextInputAction.search,
                                autofocus: true,
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Search Keyword',
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () async {
                                if (_text.text != '') {
                                  await _searchProvider.searchData(
                                    _text.text,
                                  );
                                }
                                FocusScope.of(context).unfocus();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: _searchProvider.isSearchPressed
            ? lists.length > 0
                ? ListView.builder(
                    itemCount: lists.length,
                    itemBuilder: (ctx, i) {
                      return Verse(
                        geeta: lists[i],
                        fontSize: 18,
                        textColor: Colors.white,
                      );
                    })
                : Center(
                    child: const Text('Nothing Found'),
                  )
            : Center(
                child: Text('Please enter a search keyword'),
              ));
  }
}
