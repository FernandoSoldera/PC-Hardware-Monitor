import 'package:flutter/material.dart';
import 'dart:core';

import 'graph.dart';

class CardStats extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> array;

  @override
  const CardStats({this.title, this.array});

  @override
  _CardStatsState createState() => _CardStatsState();
}

class _CardStatsState extends State<CardStats> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 30, 5),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            height: 25,
            alignment: Alignment.center,
            width: double.maxFinite,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: -13,
                  child: IconButton(
                    icon: Icon(
                      isOpen ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: Theme.of(context).accentColor,
                      size: 36,
                    ),
                    onPressed: () => {
                      setState(() => {
                        isOpen = !isOpen
                      })
                    },
                  ),
                ),
              ],
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 300),
            height: isOpen ? 120 : 0,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
            ),
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  for (var i in widget.array)
                    Graph(
                      title: i['label'],
                      value: num.parse(i['data']).toStringAsFixed(0),
                      unit: i['unit'],
                      percent: num.parse(i['percentage']),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
