import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_fetch.dart';
import 'package:flutter_application_1/search_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();  
  await fetchGenres();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey.shade200,
        scaffoldBackgroundColor: Colors.grey.shade200,
      ),
      home: const SearchPage(),
      
    );
  }
}