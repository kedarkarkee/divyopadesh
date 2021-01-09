import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/font.dart';
// import '../providers/language.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<FontManager>(builder: (context, fontManager, _) {
        double fontSize = fontManager.fontSize;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ExpansionTile(
              title: Center(
                child: ListTile(
                  title: Text(
                    'Font Size',
                    style: TextStyle(fontSize: fontSize),
                  ),
                  trailing: Text(
                    fontSize.round().toString(),
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              ),
              children: [
                Slider(
                  value: fontSize,
                  min: 12.0,
                  max: 25.0,
                  onChanged: (double val) async {
                    await fontManager.setFont(val);
                  },
                ),
              ],
            ),
            // ListTile(
            //   title: Text(
            //     "Translation Language",
            //     style: TextStyle(fontSize: fontSize),
            //   ),
            //   trailing: DropdownButton<int>(
            //     value: languageManager.language,
            //     items: [
            //       DropdownMenuItem(
            //           child: Text(
            //             'Nepali',
            //             style: TextStyle(fontSize: fontSize),
            //           ),
            //           value: 0),
            //       DropdownMenuItem(
            //           child: Text(
            //             'English',
            //             style: TextStyle(fontSize: fontSize),
            //           ),
            //           value: 1)
            //     ],
            //     onChanged: (val) async {
            //       if (val != null) {
            //         await languageManager.setLanguage(val);
            //       }
            //     },
            //   ),
            // ),
            // ListTile(
            //   title: Text(
            //     'Download Audios',
            //     style: TextStyle(fontSize: fontSize),
            //   ),
            //   onTap: () => Navigator.of(context).pushNamed('/audio'),
            // ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/theme');
              },
              title: Text(
                'Change Theme',
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ],
        );
      }),
    );
  }
}
