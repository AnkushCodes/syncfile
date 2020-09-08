import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfile/dashboard.dart';
import 'package:syncfile/repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ChangeNotifierProvider<RepoData>(
        create:(_) =>RepoData(),
        child: Dashboard())
    );
  }
}

