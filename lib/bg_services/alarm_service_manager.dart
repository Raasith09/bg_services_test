import 'dart:async';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';

void printHello() {
  print('Hello, background task!');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the background task
  await AndroidAlarmManager.initialize();

  // Schedule the background task to run every minute

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Background Timer Example',
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Timer Example'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              DateTime alarmTime =
                  DateTime.now().add(const Duration(seconds: 10));
              await AndroidAlarmManager.oneShotAt(
                alarmTime,
                0, // Unique ID for the alarm
                printHello,
                wakeup: true,
                exact: true,
                alarmClock: true,
              );
            },
            child: const Text("data")),
      ),
    );
  }
}
