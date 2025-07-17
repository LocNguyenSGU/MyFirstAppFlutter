import 'package:flutter/material.dart';
import 'package:my_first_app_flutter/screens/AgeSelectionScreen.dart';

Map<int, Color> _greenColorShades = {
  50: Color(0xFFE0F2E8),
  100: Color(0xFFB3DEC5),
  200: Color(0xFF80C99F),
  300: Color(0xFF4DB378),
  400: Color(0xFF26A65E),
  500: Color(0xFF0F9E38), // màu chính
  600: Color(0xFF0C8F32),
  700: Color(0xFF087E2A),
  800: Color(0xFF046D22),
  900: Color(0xFF004D14),
};

MaterialColor customGreen = MaterialColor(0xFF0F9E38, _greenColorShades);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phòng chống ma tuý',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customGreen,
      ),
      home: const AgeSelectionScreen(),
    );
  }
}