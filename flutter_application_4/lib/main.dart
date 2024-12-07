import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';
import 'input_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _sections = [
    FirstScreen(),
    SecondScreen(),
    ThirdScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Codelab',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Gunakan initialRoute tanpa `home` untuk menghindari konflik
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(
              currentIndex: _currentIndex,
              onTabTapped: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              sections: _sections,
            ),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
        '/input': (context) => InputScreen(),
      },
      onGenerateRoute: (settings) {
        // Fallback untuk rute yang tidak dikenali
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('404: Route not found'),
            ),
          ),
        );
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabTapped;
  final List<Widget> sections;

  const MainScreen({
    required this.currentIndex,
    required this.onTabTapped,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: sections,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'First'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Second'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Third'),
        ],
      ),
    );
  }
}
