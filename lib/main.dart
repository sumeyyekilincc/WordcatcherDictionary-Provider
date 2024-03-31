import 'package:dictionary/provider_detup.dart';
import 'package:dictionary/ui/views/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DashboardPage(),
      ),
    );
  }
}
