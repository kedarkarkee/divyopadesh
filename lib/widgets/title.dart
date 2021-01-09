import 'package:flutter/material.dart';

import '../util/nepali.dart';

class BookTitle extends StatelessWidget {
  const BookTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight / 1.5,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
      child: Center(
        child: Tooltip(
          message: title,
          child: Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}

class ChapterNumber extends StatelessWidget {
  const ChapterNumber({
    Key key,
    @required int currentPage,
  })  : _currentPage = currentPage,
        super(key: key);

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight / 1.5,
      width: kToolbarHeight / 1.5,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
      child: Center(
        child: Text(
          romanToNepali[_currentPage],
          style: Theme.of(context).textTheme.headline6,
          textScaleFactor: 0.75,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
