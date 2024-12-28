import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();
    width =
        random.nextInt(300) + 120; //300 -> Número máximo + 50 -> Número mínimo
    height = random.nextInt(300) + 120;
    color = Color.fromRGBO(
        random.nextInt(255), //red
        random.nextInt(255), //gren
        random.nextInt(255), //blue
        1); // 0 a 255, opacity
    // borderRadius = random.nextDouble() * 300;
    borderRadius = random.nextInt(100) + 20;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.bounceOut, //tipo de animación
          height: height < 0 ? 0 : height, //va a cambiar
          width: width <= 0 ? 0 : width, //va a cambiar
          decoration: BoxDecoration(
            color: color, //va a cambiar
            borderRadius: BorderRadius.circular(
                borderRadius <= 0 ? 0 : borderRadius), //va a cambiar
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: changeShape, child: const Icon(Icons.play_arrow_rounded)),
    );
  }
}
