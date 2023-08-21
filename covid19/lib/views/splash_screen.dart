import 'dart:async';

import 'package:covid19/views/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  
  late final AnimationController _controller = AnimationController(vsync: this,duration: const Duration(seconds: 3))..repeat();

  @override
  void dispose() {
    
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () { 
      Navigator.push(context, MaterialPageRoute(builder: (context) => const WorldStatesScreen(),));
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(animation: _controller, 
          child: Container(
            height: 200,
            width: 200,
            child: Center(
              child: 
              Image.asset('assets/images/virus.png',),
            ),
          ),
          builder: (context,Widget? child) {
            return Transform.rotate(angle: _controller.value * 2 * math.pi,
            child: child,
            );

          },),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
          const Align(
            alignment: Alignment.center,
            child: Text("Covid19\nTracker App",
            
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,fontWeight: FontWeight.bold
            ),),
          ),
      ]),
    );
  }
}