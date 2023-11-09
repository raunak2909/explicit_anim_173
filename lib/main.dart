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
        duration: Duration(seconds: 2))..addListener(() {
      print(animationTween.value);

      setState(() {

      });
    })..repeat(
      reverse: true
    );

    animationDouble = Tween<double>(begin: 100.0, end: 200.0).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    animationTween = ColorTween(begin: Colors.blue, end: Colors.orange).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controller'),
      ),
      body: Center(
        child: Container(
          width: animationDouble.value,
          height: animationDouble.value,
          color: animationTween.value,
        ),
      ),
    );
  }
}
