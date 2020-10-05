import 'package:flutter/material.dart';
import 'package:pc_hardware_monitor/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import 'screens/stats.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xff232323),
          accentColor: Color(0xffc6ff00),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final controller = TextEditingController(text: '192.168.0.21:82');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Select your server IP Address',
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: TextField(
                controller: controller,
                style: TextStyle(color: Theme.of(context).accentColor),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).accentColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1, color: Theme.of(context).accentColor))),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: ButtonTheme(
                minWidth: 150,
                height: 50,
                child: RaisedButton(
                  color: Colors.transparent,
                  textColor: Theme.of(context).accentColor,
                  child: Text('Connect', style: TextStyle(fontSize: 18)),
                  onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => Stats(ipAddress: controller.text),
                      ),
                    )
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(
                        color: Theme.of(context).accentColor,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
