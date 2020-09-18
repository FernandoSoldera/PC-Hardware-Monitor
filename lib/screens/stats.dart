import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../components/card.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class Stats extends StatefulWidget {
  String ipAddress;

  @override
  Stats({this.ipAddress});

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  final transformer = Xml2Json();
  List<Map<String, dynamic>> gpuArray = [];
  List<Map<String, dynamic>> cpuArray = [];
  List<Map<String, dynamic>> memoryArray = [];
  List<Map<String, dynamic>> fpsArray = [];

  @override
  void initState() {
    super.initState();
    Timer.periodic(new Duration(seconds: 1), (timer) {
      fectch();
    });
  }

  List<dynamic> convertResponseToList(body) {
    transformer.parse(body);
    var jsonString = transformer.toGData();
    Map<String, dynamic> json = jsonDecode(jsonString);
    return json['HardwareMonitor']['HardwareMonitorEntries']['HardwareMonitorEntry'];
  }

  String getLabelFromName(name) {
    if(name == 'GPU temperature' || name == 'CPU temperature') {
      return 'TEMP';
    } else if(name == 'Core clock' || name == 'CPU clock') {
      return 'CLOCK';
    } else if(name == 'CPU usage' || name == 'GPU usage') {
      return 'USO';
    } else if(name == 'RAM usage') {
      return 'RAM';
    } else if(name == 'Memory usage') {
      return 'VRAM';
    }
    return '';
  }

  String getPercentage(data, max) {
    return ((num.parse(data) / num.parse(max))).toStringAsFixed(3);
  }

  List<dynamic> createInfoJson (List<dynamic> list) {
    List<Map<String, dynamic>> gpuArrayAux = [];
    List<Map<String, dynamic>> cpuArrayAux = [];
    List<Map<String, dynamic>> memoryArrayAux = [];
    List<Map<String, dynamic>> fpsArrayAux = [];

    Map<String, dynamic> json = {};
    list.forEach((element) {
      String data = element['data']['\$t'];
      String max = element['maxLimit']['\$t'];
      String name = element['srcName']['\$t'];
      String unit = element['srcUnits']['\$t'];
      String label = getLabelFromName(element['srcName']['\$t']);
      String percentage = getPercentage(data, max);

      json = {'data': data, 'percentage': percentage, 'unit':unit, 'label':label};
      
      if(name == 'GPU temperature' || name == 'GPU usage' || name == 'Core clock') {
        gpuArrayAux.add(json);
      } else if(name == 'CPU temperature' || name == 'CPU usage' || name == 'CPU clock') {
        cpuArrayAux.add(json);
      } else if(name == 'Memory usage' || name == 'RAM usage') {
        memoryArrayAux.add(json);
      } else if(name == 'Framerate') {
        fpsArrayAux.add(json);
      }
    });

    setState(() {
      gpuArray = gpuArrayAux;
      cpuArray = cpuArrayAux;
      memoryArray = memoryArrayAux;
      fpsArray = fpsArrayAux;
    });
  }

  Future<http.Response> fectch() async {
    final response =  await http.post('http://' + widget.ipAddress+'/mahm',
                            headers: {'Authorization': "Basic " + base64Encode(utf8.encode("MSIAfterburner:17cc95b4017d496f82"))});
    List<dynamic> list = convertResponseToList(response.body);
    createInfoJson(list);
    return response;
  }

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
          
        ),
        body: Container(
          height: double.maxFinite,
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  CardStats(
                    title: 'GPU',
                    array: gpuArray
                  ),
                  CardStats(
                    title: 'CPU',
                    array: cpuArray
                  ),
                  CardStats(
                    title: 'MEMORY',
                    array: memoryArray
                  ),
                  CardStats(
                    title: 'FPS',
                    array: fpsArray
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
