import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/staff.dart';
import 'screens/students.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Nav WebView App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color.fromARGB(255, 249, 242, 236),
      ),
      home: const BottomNavApp(),
    );
  }
}

class BottomNavApp extends StatefulWidget {
  const BottomNavApp({super.key});

  @override
  State<BottomNavApp> createState() => _BottomNavAppState();
}

class _BottomNavAppState extends State<BottomNavApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    StudentProfileScreen(),   // 🌐 Your website tab
    StaffProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: _pages[_selectedIndex],
  bottomNavigationBar: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 236, 138, 26), // golden yellow
          Color.fromARGB(255, 234, 204, 55), // warm orange
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: BottomNavigationBar(
      backgroundColor: Colors.transparent, // ✅ use transparent so gradient shows
      elevation: 0,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.black,
      unselectedItemColor: const Color.fromARGB(255, 245, 238, 217),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Students',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Staff',
        ),
      ],
    ),
  ),
);

  }
}
