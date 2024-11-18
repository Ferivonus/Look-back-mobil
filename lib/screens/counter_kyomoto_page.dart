import 'package:flutter/material.dart';

class CounterKyomotoPage extends StatefulWidget {
  const CounterKyomotoPage({super.key});

  @override
  State<CounterKyomotoPage> createState() => _CounterKyomotoPageState();
}

class _CounterKyomotoPageState extends State<CounterKyomotoPage> {
  int _counter = 0;

  // List of motivational or funny quotes
  final List<String> _messages = [
    "Kyomoto says: Keep pushing forward!",
    "“A blank page holds infinite possibilities.”",
    "You’re doing great! One step closer to greatness!",
    "Every press brings Kyomoto's dream closer to reality!",
    "“Art comes from the heart. So does this counter!”",
    "More clicks, more progress! Go, go, go!",
    "Clicking is an art form too, Kyomoto approves!",
    "“Every little effort adds up in the end.”",
    "Never stop! Each click is a masterpiece!",
  ];

  String _currentMessage = "Kyomoto says: Let's get started!";

  void _incrementCounter() {
    setState(() {
      _counter++;
      _currentMessage =
          _messages[_counter % _messages.length]; // Cycle messages
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kyomoto’s Motivational Counter'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image instead of CircleAvatar
            Container(
              width: 120, // Adjust size as needed
              height: 120, // Adjust size as needed
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/look_back_cute.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _currentMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Counter:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                'Motivate Kyomoto!',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
