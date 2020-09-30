import 'package:flutter/material.dart';
import 'package:pc_hardware_monitor/components/setting_item.dart';
import 'package:pc_hardware_monitor/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff232323),
        accentColor: Color(0xffc6ff00),
        cardColor: Color(0xff3a3a3a),
        backgroundColor: Color(0xff525252),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).accentColor,
              size: 34,
            ),
            onPressed: () => {Navigator.of(context).pop()},
          ),
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          color: Theme.of(context).primaryColor,
          child: Column(
            children: <Widget>[
              SettingsItem(
                title: 'GPU',
                isChecked: Provider.of<SettingsProvider>(context).isGpuChecked,
                setIsChecked: (value) => {
                  setState(() => {
                        Provider.of<SettingsProvider>(context, listen: false)
                            .setGpuChecked(value)
                      })
                },
              ),
              SettingsItem(
                title: 'CPU',
                isChecked: Provider.of<SettingsProvider>(context).isCpuChecked,
                setIsChecked: (value) => {
                  setState(() => {
                        Provider.of<SettingsProvider>(context, listen: false)
                            .setCpuChecked(value)
                      })
                },
              ),
              SettingsItem(
                title: 'Memory',
                isChecked: Provider.of<SettingsProvider>(context).isMemoryChecked,
                setIsChecked: (value) => {
                  setState(() => {
                        Provider.of<SettingsProvider>(context, listen: false)
                            .setMemoryChecked(value)
                      })
                },
              ),
              SettingsItem(
                title: 'FPS',
                isChecked: Provider.of<SettingsProvider>(context).isFpsChecked,
                setIsChecked: (value) => {
                  setState(() => {
                        Provider.of<SettingsProvider>(context, listen: false)
                            .setFpsChecked(value)
                      })
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
