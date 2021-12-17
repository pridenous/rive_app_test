import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',  
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Using Rive'),
      ),
      body: RocketContainer(),
    );
  }
}

class RocketContainer extends StatefulWidget {

  @override
  _RocketContainerState createState() => _RocketContainerState();
}

class _RocketContainerState extends State<RocketContainer> {
  late Artboard _artboard;
  late RiveAnimationController _rocketController;

  @override
  void initState() {
    _loadRiveFile();
    super.initState(); 
  }

  void _loadRiveFile() async {
    final bytes = await rootBundle.load('assets/rocket.riv');
  }
  Widget build(BuildContext context) {
    return Container();
  }
}