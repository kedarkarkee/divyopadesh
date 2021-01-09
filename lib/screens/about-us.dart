import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../util/custom_icons_icons.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Us')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            const Text(
              'Developer:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(),
            Image.asset('assets/santosh.jpg', fit: BoxFit.cover),
            Divider(),
            const Text(
              'Santosh Thapa Magar',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blue),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            Divider(),
            const Text(
              'Contact Us:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      CustomIcons.facebook,
                      color: Colors.blue,
                    ),
                    onPressed: () async {
                      const _url =
                          'https://www.facebook.com/com.bhagavadgita.santosh';
                      if (await canLaunch(_url)) {
                        await launch(_url);
                      }
                    }),
                IconButton(
                    icon: Icon(
                      CustomIcons.instagram,
                      color: Colors.blue,
                    ),
                    onPressed: () async {
                      const _url = 'https://www.instagram.com/new.santosh.3/';
                      if (await canLaunch(_url)) {
                        await launch(_url);
                      }
                    }),
                IconButton(
                    icon: Icon(
                      CustomIcons.twitter,
                      color: Colors.blue,
                    ),
                    onPressed: () async {
                      const _url = 'https://twitter.com/newsantosh3';
                      if (await canLaunch(_url)) {
                        await launch(_url);
                      }
                    }),
              ],
            ),
            // const Text(
            //   'Audio Recorded By:',
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            // Divider(),
            // Image.asset('assets/aashish.jpg', fit: BoxFit.cover),
            // Divider(),
            // const Text(
            //   'Aashish Pathak',
            //   style: const TextStyle(
            //       fontWeight: FontWeight.bold, color: Colors.blue),
            //   softWrap: true,
            //   textAlign: TextAlign.center,
            // ),
            // Divider(),
            // Divider(),
            // const Text(
            //   'Special Thanks:',
            //   style: const TextStyle(fontWeight: FontWeight.bold),
            // ),
            // Divider(),
            // const Text(
            //   'Mani Kashyap \n\nAmrit Giri \n\nMin Bishwakarma \n\nSandip Khanal \n\nYubraj Shrestha \n\nAbhisek Joshi \n\nSantosh Aryal \n\nKrishna Gyawali\n\n',
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }
}
