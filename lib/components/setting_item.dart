import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  String title;
  bool isChecked;

  @override
  SettingsItem({this.title, this.isChecked, this.setIsChecked});

  void Function(bool) setIsChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.white12))
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 20,
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (value) => setIsChecked(value),
            )
          ],
        ),
      ),
    );
  }
}



