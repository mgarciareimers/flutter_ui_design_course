import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models.
import 'package:shoes/src/models/shoe_model.dart';

// Pages.
import 'package:shoes/src/pages/shoe_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoeModel()),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes App',
      debugShowCheckedModeBanner: false,
      home: ShoePage(),
    );
  }
}