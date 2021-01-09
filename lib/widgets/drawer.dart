import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../util/strings.dart';
import './rate.dart';

Widget drawer(BuildContext context) {
  final color = Theme.of(context).accentColor;
  return Drawer(
      child: SafeArea(
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Card(
            elevation: 2.0,
            child: Image.asset(
              'assets/banner.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.bookmark, color: color),
          title: const Text(bookmarks),
          onTap: () {
            Navigator.of(context).pushNamed('/bookmarks');
          },
        ),
        ListTile(
          leading: Icon(Icons.settings, color: color),
          title: const Text(settings),
          onTap: () {
            Navigator.of(context).pushNamed('/settings');
          },
        ),
        ListTile(
          leading: Icon(Icons.info, color: color),
          title: const Text('About App'),
          onTap: () {
            Navigator.of(context).pushNamed('/aboutApp');
          },
        ),
        ListTile(
          leading: Icon(Icons.person, color: color),
          title: const Text('About Us'),
          onTap: () {
            Navigator.of(context).pushNamed('/aboutUs');
          },
        ),
        // ListTile(
        //   leading: Icon(Icons.assessment, color: color),
        //   title: const Text('Send Message'),
        //   onTap: () {
        //     Navigator.of(context).pushNamed('/test');
        //   },
        // ),
        ListTile(
          leading: Icon(Icons.star, color: color),
          title: const Text('Rate Us'),
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return RateBar();
                });
          },
        ),
        ListTile(
          leading: Icon(Icons.share, color: color),
          title: const Text('Share'),
          onTap: () {
            Share.share(appUrl);
          },
        ),
      ],
    ),
  ));
}
