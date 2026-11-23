import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'pages/home_page.dart';

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
      home: const HomePage(),
    );
  }
}
