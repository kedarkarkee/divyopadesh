import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RateBar extends StatefulWidget {
  const RateBar({Key key}) : super(key: key);

  @override
  _RateBarState createState() => _RateBarState();
}

class _RateBarState extends State<RateBar> {
  var _stars = 0;
  final url =
      'https://play.google.com/store/apps/details?id=com.dibyopadesh.santosh';
  final market = 'market://details?id=com.dibyopadesh.santosh';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Please take a moment to rate us'),
      content: Row(
        children: [1, 2, 3, 4, 5].map((e) {
          return Expanded(
            child: IconButton(
                icon: Icon(_stars >= e ? Icons.star : Icons.star_border),
                onPressed: () {
                  setState(() {
                    _stars = e;
                  });
                }),
          );
        }).toList(),
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {
            canLaunch(market).then((value) {
              if (value)
                launch(market);
              else
                launch(url).catchError((e) => print("error"));
            });
          },
          child: Text('Rate'),
        ),
      ],
    );
  }
}
