import 'package:flutter/material.dart';
import 'package:namaz_counter_provider/pages/home_page.dart';
import 'package:namaz_counter_provider/providers/statistic_provider.dart';
import 'package:provider/provider.dart';
import 'providers/namaz_provider.dart';
import 'providers/setting_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NamazProvider()),
        ChangeNotifierProvider(create: (_) => SettingProvider()),
        ChangeNotifierProvider(create: (_) => StatisticProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFf4eeff),
          appBarTheme: AppBarTheme(
            color: Color(0xFF424874),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 17,
              color: Color(0xff424874),
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xFF424874),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
