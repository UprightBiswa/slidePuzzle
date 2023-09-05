import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slide Puzzle',
      home: SlidePuzzle(),
    );
  }
}
class SlidePuzzle extends StatefulWidget {
  const SlidePuzzle({Key? key}) : super(key: key);

  @override
  State<SlidePuzzle> createState() => _SlidePuzzleState();
}

class _SlidePuzzleState extends State<SlidePuzzle> {
  int valueSlider = 2;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(extendBodyBehindAppBar: true,
    appBar: AppBar(
      centerTitle: true,
      title: Text(
        "slide Puzzle ${valueSlider}x$valueSlider",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.red,
          shadows: [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0,
              color: Colors.yellow.withOpacity(0.4),
            ),
          ],
          decoration: TextDecoration.none,
          decorationColor: Colors.green.withOpacity(0.6),
          decorationThickness: 2.0,
        ),
      ),
      actions:[],
    ),
    body: Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: Colors.green[100],
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "slide Puzzle ${valueSlider}x$valueSlider",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0,
                      color: Colors.green.withOpacity(0.4),
                    ),
                  ],
                  decoration: TextDecoration.none,
                  decorationColor: Colors.white.withOpacity(0.6),
                  decorationThickness: 2.0,
                ),
              ),
            ),
            Container(
              child: Slider(
                min: 2,
                  max: 15,
                  divisions: 13,
                  label: "${valueSlider.toString()}",
                  value: valueSlider.toDouble(),
                  onChanged: (value){
                    setState(
                        () {
                      valueSlider = value.toInt();
                          },
                          );
              }),
            )

          ],
        ),
      ),
    ),
    );
  }
}
