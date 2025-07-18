import 'package:flutter/material.dart';
import 'package:my_first_app_flutter/screens/18_30/missionOverall.dart';

import '12_18/MapSliderScreen.dart';

class CustomAgeButton extends StatelessWidget {
  final int age;
  final String title;
  final String subtitle;
  final String imagePath;
  final VoidCallback onPressed;
  final bool isSelected;
  final bool isOtherSelected;

  const CustomAgeButton({
    super.key,
    required this.age,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onPressed,
    required this.isSelected,
    required this.isOtherSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isSelected
        ? Colors.white
        : isOtherSelected
        ? const Color(0xFFE0F5E8)
        : Colors.white;

    final titleColor = isSelected
        ? const Color(0xFF0F9E38)
        : isOtherSelected
        ? Colors.black
        : Colors.black;

    final subtitleColor = isSelected
        ? const Color(0xFF0F9E38)
        : isOtherSelected
        ? Colors.black54
        : Colors.grey;

    return Transform.scale(
      scale: isSelected ? 1.05 : 1.0, // Tăng 5% nếu được chọn
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 16, horizontal: 33),
          ),
          elevation: MaterialStateProperty.all(isSelected ? 10 : 0),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: 70,
              height: 70,
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: titleColor,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: subtitleColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class AgeSelectionScreen extends StatefulWidget {
  const AgeSelectionScreen({super.key});

  @override
  State<AgeSelectionScreen> createState() => _AgeSelectionScreenState();
}

class _AgeSelectionScreenState extends State<AgeSelectionScreen> {
  int? selectedAge;

  void _navigateByAge(int age) {
    setState(() {
      selectedAge = age;
    });

    if (age >= 12 && age <= 18) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MapSliderScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MissionOverall()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F9E38),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(88),
        child: Container(
          margin: const EdgeInsets.only(top: 10),
          child: AppBar(
            backgroundColor: const Color(0xFF0F9E38),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: IconButton(
                    icon: const Icon(Icons.sos),
                    color: Colors.white,
                    onPressed: () {
                      print('SOS pressed');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0), // 👈 padding trái/phải
              child: const Text(
                'Bạn thuộc độ tuổi nào?',
                style: TextStyle(
                  fontSize: 39,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.3, // 👈 tăng line height
                ),
                textAlign: TextAlign.center, // 👈 căn giữa nếu có xuống dòng
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 350,
                    child: CustomAgeButton(
                      age: 12,
                      title: '12-18 tuổi',
                      subtitle: 'Hành trình phiêu lưu',
                      imagePath: 'assets/age_12_18.png',
                      onPressed: () => _navigateByAge(12),
                      isSelected: selectedAge == 12,
                      isOtherSelected: selectedAge != null && selectedAge != 12,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 350,
                    child: CustomAgeButton(
                      age: 20,
                      title: '18-30 tuổi',
                      subtitle: 'Nhiệm vụ đặc việt',
                      imagePath: 'assets/age_18_30.png',
                      onPressed: () => _navigateByAge(20),
                      isSelected: selectedAge == 20,
                      isOtherSelected: selectedAge != null && selectedAge != 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}