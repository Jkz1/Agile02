import 'package:agile02/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:agile02/providers/data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //isi disini provider yng mo kelen pake contohnya dibawah
        // ChangeNotifierProvider(create: (_) => contohprov());
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          disabledColor: Colors.grey.withOpacity(0.7),
          appBarTheme: AppBarTheme(
              backgroundColor: Color(0xff9ED447),
              elevation: 10,
              shadowColor: Colors.black,
              centerTitle: true),
          scaffoldBackgroundColor: Color(0xff3E6C29),
          primarySwatch: Colors.blue,
        ),
      home: Home(),
      ),
    );
  }
}
