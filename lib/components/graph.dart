import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Graph extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final double percent;

  @override
  const Graph({this.title, this.value, this.unit, this.percent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Align(
        alignment: Alignment.center,
        child: new CircularPercentIndicator(
          backgroundColor: Color(0xff777777),
          progressColor: Theme.of(context).accentColor,
          radius: 100.0,
          lineWidth: 6.0,
          percent: percent,
          animation: true,
          animateFromLastPercent: true,
          animationDuration: 300,
          center: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Text(
                  unit,
                  style: TextStyle(
                    fontSize: 10,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ),
          circularStrokeCap: CircularStrokeCap.round,
        ),
      ),
    );
  }
}
