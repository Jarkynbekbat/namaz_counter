import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:namaz_counter_provider/pages/calc_page.dart';
import 'package:namaz_counter_provider/pages/setting_page.dart';
import 'package:namaz_counter_provider/pages/statistic_page.dart';
import 'package:namaz_counter_provider/services/local/local_data_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [CalcPage(), StatisticPage(), SettingPage()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    LocalDataService.getData('dateFrom').then((dateFrom) {
      if (dateFrom == null) {
        setState(() => _selectedIndex = 2);
      } else {
        LocalDataService.getData('firstSum').then((firstSum) {
          if (firstSum == null) {
            setState(() => _selectedIndex = 0);
          }
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Учет намазов'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          color: Color(0xFF424874),
          // color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Color(0xFF424874),
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 600),
                tabBackgroundColor: Color(0xFFdcd6f7),
                tabs: [
                  GButton(
                    icon: Icons.create,
                    text: 'Учет',
                    iconColor: Colors.white,
                  ),
                  GButton(
                    icon: Icons.timeline,
                    text: 'Статистика',
                    iconColor: Colors.white,
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Настройки',
                    iconColor: Colors.white,
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
