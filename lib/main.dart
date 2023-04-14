import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Slide Puzzle',
      home: SlidePuzzle(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SlidePuzzle extends StatefulWidget {
  @override
  _SlidePuzzleState createState() => _SlidePuzzleState();
}

class _SlidePuzzleState extends State<SlidePuzzle> {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 0];
  Random random = Random();

  @override
  void initState() {
    super.initState();
    shuffleNumbers();
  }

  void shuffleNumbers() {
    for (int i = numbers.length - 1; i > 0; i--) {
      int j = random.nextInt(i + 1);
      int temp = numbers[i];
      numbers[i] = numbers[j];
      numbers[j] = temp;
    }
  }

  bool checkCompletion() {
    List<int> sortedNumbers = List.from(numbers);
    sortedNumbers.sort();
    return numbers.toString() == sortedNumbers.toString();
  }

  void moveTile(int index) {
    int emptyIndex = numbers.indexOf(0);
    if ((index == emptyIndex - 1 && emptyIndex % 3 != 0) ||
        (index == emptyIndex + 1 && index % 3 != 0) ||
        index == emptyIndex - 3 ||
        index == emptyIndex + 3) {
      setState(() {
        int temp = numbers[index];
        numbers[index] = 0;
        numbers[emptyIndex] = temp;
      });
      if (checkCompletion()) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Congratulations!'),
                content: Text('You have solved the puzzle.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        shuffleNumbers();
                        Navigator.of(context).pop();
                      },
                      child: Text('Play Again'))
                ],
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slide Puzzle'),
      ),
      body: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              moveTile(index);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Center(
                child: Text('${numbers[index]}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
