import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Map2Lock extends StatelessWidget {
  const Map2Lock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true, // Quan trọng để background phủ cả AppBar
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(88),
        //   child: AppBar(
        //     backgroundColor: Colors.transparent,
        //     foregroundColor: Colors.white,
        //     elevation: 0,
        //     automaticallyImplyLeading: false, // Tắt icon mặc định
        //
        //     title: GestureDetector(
        //       onTap: () {
        //         Navigator.pop(context);
        //       },
        //       child: Row(
        //         children: [
        //           const Icon(Icons.arrow_back_ios_new, size: 20), // Dấu lớn hơn
        //           const SizedBox(width: 4),
        //           const Text(
        //             'Quay lại',
        //             style: TextStyle(
        //               fontSize: 20,
        //               fontWeight: FontWeight.w700,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //
        //     actions: [
        //       Container(
        //         margin: const EdgeInsets.only(right: 10),
        //         decoration: BoxDecoration(
        //           color: Colors.red,
        //           shape: BoxShape.circle,
        //           boxShadow: [
        //             BoxShadow(
        //               color: Colors.black.withOpacity(0.2),
        //               blurRadius: 6,
        //               offset: const Offset(0, 3),
        //             ),
        //           ],
        //         ),
        //         child: SizedBox(
        //           width: 60,
        //           height: 60,
        //           child: IconButton(
        //             icon: const Icon(Icons.sos),
        //             color: Colors.white,
        //             onPressed: () {
        //               print('SOS pressed');
        //             },
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        body: Stack(
          children: [
            // Background image covering the entire screen
            Positioned.fill(
              child: Image.asset(
                'assets/12_18/bg_map_2.png',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),

            // Main content: island and star
            Align(
              alignment: Alignment.topCenter, // Center horizontally, align to top vertically
              child: Padding(
                padding: const EdgeInsets.only(top: 150), // Adjust vertical position here
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center, // Center children horizontally
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/12_18/map_2_lock.png',
                          width: 280,
                          height: 270,
                        ),
                        Transform.translate(
                          offset: const Offset(0, 94),
                          child: Image.asset(
                            'assets/12_18/lock_map.png',
                            width: 161,
                            height: 97,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 300, // 👈 Giới hạn chiều rộng để xuống hàng
                      child: Stack(
                        children: [
                          // Viền chữ
                          Text(
                            'Thung lũng cảnh báo',
                            style: GoogleFonts.baloo2(
                              fontSize: 48,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 8
                                ..color = const Color(0xFF004D40),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // Chữ có gradient
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [Color(0xFFFFA500), Color(0xFFFFD700)],
                            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                            blendMode: BlendMode.srcIn,
                            child: Text(
                              'Thung lũng cảnh báo',
                              style: GoogleFonts.baloo2(
                                fontSize: 48,
                                fontWeight: FontWeight.w900,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 80),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     gradient: const LinearGradient(
                    //       colors: [Color(0xFF3AD42E), Color(0xFF269E38)],
                    //     ),
                    //     borderRadius: BorderRadius.circular(37),
                    //   ),
                    //   child: TextButton.icon(
                    //     onPressed: () {
                    //       // TODO: Hành động khi nhấn nút
                    //     },
                    //     icon: const Icon(Icons.search, color: Colors.white, size: 34),
                    //     label: Text(
                    //       'Khám phá map2',
                    //       style: GoogleFonts.baloo2(
                    //         fontSize: 27,
                    //         fontWeight: FontWeight.w900,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //     style: TextButton.styleFrom(
                    //       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    //     ),
                    //   ),
                    // ),

                  ],
                ),
              ),

            ),
          ],
        )
    );
  }
}