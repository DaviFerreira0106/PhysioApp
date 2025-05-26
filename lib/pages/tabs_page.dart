import 'package:flutter/material.dart';
import 'package:physioapp/pages/home_page.dart';
import 'package:physioapp/pages/exercises_page.dart';
import 'package:physioapp/components/app_drawer.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  TabsPageState createState() {
    return TabsPageState();
  }
}

class TabsPageState extends State<TabsPage> {
  int _index = 0;

  void _onChangeIndex(int index) {
    setState(() => _index = index);
  }

  final List<Map<String, Object>> _tabSreen = [
    {
      'title': 'Pagína Inicial',
      'screen': const HomePage(),
    },
    {
      'title': 'Exercício',
      'screen': const ExercisesPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final String title = _tabSreen.elementAt(_index)['title'] as String;
    final Widget body = _tabSreen.elementAt(_index)['screen'] as Widget;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
      drawer: const AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_mosaic),
            label: 'Exercícios',
          ),
        ],
        currentIndex: _index,
        onTap: _onChangeIndex,
      ),
    );
  }
}
