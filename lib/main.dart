import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animationDouble;
  late Animation<Color?> animationTween;

  @override
  void initState() {
    super.initState();

    //0 to 1
    controller = AnimationController(vsync: this,
        duration: Duration(seconds: 10))..addListener(() {
      //print(animationTween.value);
      print(controller.value);

     /* setState(() {

      });*/
    })/*..repeat(
      reverse: true
    )*/..forward();
    //controller.forward();

    animationDouble = Tween<double>(begin: 0, end: 4*pi).animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    animationTween = ColorTween(begin: Colors.blue, end: Colors.orange).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));



  }


  @override
  Widget build(BuildContext context) {
    print("Build function called!!");
    return Scaffold(
      appBar: AppBar(
        title: Text('Controller'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, childToAnimate){
            return Transform.rotate(
              angle: animationDouble.value,
              child: childToAnimate,
            );
          },
          child: Image.asset("assets/images/ic_clock.png", width: 100, height: 100,)
        ),
      ),
    );
  }
}
