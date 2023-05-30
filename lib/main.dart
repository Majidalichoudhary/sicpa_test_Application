import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/ArticlesPr.dart';
import 'Screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ArticlePr()),
      ],
      child: MaterialApp(
        title: 'NYT Article',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'NYT'),
      ),
    );
  }
}


