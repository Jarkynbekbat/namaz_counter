import 'package:flutter/material.dart';
import 'package:namaz_counter_provider/pages/home_page.dart';
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
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
