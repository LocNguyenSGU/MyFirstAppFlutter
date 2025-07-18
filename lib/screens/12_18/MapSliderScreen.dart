import 'package:flutter/material.dart';
import 'package:my_first_app_flutter/screens/12_18/map_4_lock.dart';
import 'map_1.dart';
import 'map_2_lock.dart';
import 'map_3_lock.dart';
import 'map_5_lock.dart';

class MapSliderScreen extends StatefulWidget {
  const MapSliderScreen({super.key});

  @override
  State<MapSliderScreen> createState() => _MapSliderScreenState();
}

class _MapSliderScreenState extends State<MapSliderScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> pages = [
    const Map1(),
    const Map2Lock(),
    const Map3Lock(),
    const Map4Lock(),
    const Map5Lock(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(88),
        child: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios_new,
                  size: 25,
                  color: Colors.black, // chỉnh màu đen ở đây
                ),
                SizedBox(width: 4),
                Text(
                  'Quay lại',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
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
      body: PageView(
        controller: _pageController,
        children: pages,
      ),
    );
  }
}