import 'package:flutter/material.dart';
import 'package:speech_stroop/screens/components/button/primary_button.dart';
import 'package:speech_stroop/screens/homepage/history.dart';
import 'package:speech_stroop/screens/homepage/homepage.dart';
import 'package:speech_stroop/screens/homepage/profile.dart';

void main() => runApp(const HomepageWidget());

class HomepageWidget extends StatelessWidget {
  const HomepageWidget({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: HomepageWidgetState(),
    );
  }
}

class HomepageWidgetState extends StatefulWidget {
  const HomepageWidgetState({Key key}) : super(key: key);

  @override
  State<HomepageWidgetState> createState() => _HomepageWidgetStateState();
}

class _HomepageWidgetStateState extends State<HomepageWidgetState> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ProfileWidget(),
    MainWidget(),
    HistoryWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'ประวัติ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp),
            label: 'ข้อมูลส่วนตัว',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
