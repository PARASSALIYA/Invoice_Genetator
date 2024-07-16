import 'package:flutter/cupertino.dart';
import 'package:invoice_genetator/header_files.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.invoice);
              },
              child: Container(
                height: s.height * 0.13,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Invoice Bill"),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// void main() {
//   runApp(TimerApp());
// }
//
// class TimerApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Timer App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: TimerHomePage(),
//     );
//   }
// }
//
// class TimerHomePage extends StatefulWidget {
//   @override
//   _TimerHomePageState createState() => _TimerHomePageState();
// }
//
// class _TimerHomePageState extends State<TimerHomePage> {
//   DateTime _currentTime = DateTime.now();
//   Timer? _timer;
//   Duration _elapsedTime = Duration.zero;
//   bool _isRunning = false;
//   List<String> _flags = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _startClock();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   void _startClock() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         _currentTime = DateTime.now();
//         if (_isRunning) {
//           _elapsedTime += const Duration(seconds: 1);
//         }
//       });
//     });
//   }
//
//   void _toggleTimer() {
//     setState(() {
//       _isRunning = !_isRunning;
//     });
//   }
//
//   void _resetTimer() {
//     setState(() {
//       _elapsedTime = Duration.zero;
//       _isRunning = false;
//     });
//   }
//
//   void _addFlag() {
//     setState(() {
//       _flags.add(DateFormat.Hms().format(_currentTime));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Timer App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               DateFormat.Hms().format(_currentTime),
//               style: const TextStyle(fontSize: 24),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               '${_elapsedTime.inHours.toString().padLeft(2, '0')}:${(_elapsedTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}',
//               style: const TextStyle(fontSize: 24),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: _toggleTimer,
//                   child: _isRunning ? const Text('Pause') : const Text('Start'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _resetTimer,
//                   child: const Text('Reset'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _addFlag,
//                   child: const Text('Flag'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Flags:',
//               style: TextStyle(fontSize: 20),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _flags.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_flags[index]),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
