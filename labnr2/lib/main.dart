import 'package:flutter/material.dart';
import 'home_page.dart';
import 'courses_page.dart';
import 'app_colors.dart';

void main() {
  runApp(const CourseAppClone());
}

class CourseAppClone extends StatelessWidget {
  const CourseAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course App UI Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryBlue),
      ),
      home: const RootNav(),
    );
  }
}

// Contine ambele pagini si comuta intre ele printr-o bara de navigare jos.
// IndexedStack pastreaza starea fiecarei pagini cand comuti intre ele.
class RootNav extends StatefulWidget {
  const RootNav({super.key});

  @override
  State<RootNav> createState() => _RootNavState();
}

class _RootNavState extends State<RootNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    CoursesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryBlue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Courses',
          ),
        ],
      ),
    );
  }
}