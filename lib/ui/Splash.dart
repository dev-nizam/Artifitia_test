import 'package:artifitia_test/ui/Dashboard.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {

    goToDashboard();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue,
        body: Container(
      child: Center(
        child: Text("Artifitia Flutter Assigment",style: TextStyle(color: Colors.white),),

      ),
    ));
  }

  Future<void> goToDashboard() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (ctx) => Dashboard()));
  }

}
