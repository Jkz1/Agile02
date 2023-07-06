import 'package:agile02/MainHome.dart';
import 'package:agile02/home.dart';
import 'package:agile02/page/payment_option_box.dart';
import 'package:agile02/page/wd.dart';
import 'package:agile02/providers/about_akun.dart';
import 'package:agile02/providers/donation_model.dart';
import 'package:agile02/providers/listakun.dart';
import 'package:agile02/providers/pageProv.dart';
import 'package:agile02/providers/payment_opt_prov.dart';
import 'package:agile02/providers/trending_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:agile02/providers/data_provider.dart';

import 'providers/donation_provider.dart';

import 'page/homepage.dart';

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
        ChangeNotifierProvider(create: (context) => MyCardProvider()),
        ChangeNotifierProvider(create: (context) => DonationModel()),
        ChangeNotifierProvider<DataProvider>(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => PaymentOptProv()),
        ChangeNotifierProvider(create: (_) => AboutAkun()),
        ChangeNotifierProvider(create: (_) => DonationProvider()),
        ChangeNotifierProvider(create: (_) => TrendingData()),
        ChangeNotifierProvider(create: (_) => pageProv()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Quicksand",
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
