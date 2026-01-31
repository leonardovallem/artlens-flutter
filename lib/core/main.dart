import 'package:artlens/core/injection.dart';
import 'package:artlens/core/router.dart';
import 'package:flutter/material.dart';

void main() async {
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) =>
      MaterialApp.router(routerConfig: router);
}
