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
    final file = RiveFile.import(bytes);

    setState(() {
      _artboard = file.mainArtboard;

    });
  }

  void _launch() {
    _artboard.addController(_rocketController = SimpleAnimation('launch'));
    setState(() => _rocketController.isActive = true);
  }

  void _fall() {
    _artboard.addController(_rocketController = SimpleAnimation('fall'));
    setState(() => _rocketController.isActive = true);
  }

  Widget build(BuildContext context) {
    return Container(
      child: _artboard != null 
        ? Rive(artboard: _artboard, fit: BoxFit.cover)
        : Container(color: Colors.red),
    );
  }
}