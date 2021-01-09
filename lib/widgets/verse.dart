import 'package:flutter/material.dart';

import '../util/variables.dart';
import '../models/geeta.dart';
// import './player.dart';

class Verse extends StatelessWidget {
  Verse(
      {Key key,
      @required this.geeta,
      this.fontSize,
      this.textColor,
      this.scaffoldKey})
      : super(key: key);
  final Geeta geeta;
  final double fontSize;
  final Color textColor;
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: textColor == Colors.grey[400] ? textColor : color[geeta.color],
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  geeta.data.trim(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Theme.of(context).textTheme.headline6.color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
