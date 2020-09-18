import 'package:flutter/material.dart';
import 'dart:core';

import 'graph.dart';

class CardStats extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> array;

  @override
  const CardStats({this.title, this.array});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 30, 5),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            height: 30,
            alignment: Alignment.center,
            width: double.maxFinite,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                for (var i in array) Graph(
                  title: i['label'],
                  value: num.parse(i['data']).toStringAsFixed(0),
                  unit: i['unit'],
                  percent: num.parse(i['percentage']),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
