import 'package:flutter/material.dart';

class ListTaskMap1 extends StatelessWidget {
  const ListTaskMap1({super.key});

  Widget TaskItem(String backgroundImage, String title, String subtitle, color) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 170, // hoặc MediaQuery.of(context).size.width * 0.8
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
        SizedBox(
          width: 150,
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          )
        ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Chơi ngay',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

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
                  color: Colors.black,
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
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // 🌿 Ảnh lá sao nằm dưới cùng
                      Transform.translate(
                        offset: const Offset(70, -60),
                        child: Image.asset(
                          'assets/12_18/map_1/ic_leaf.png',
                          width: 244,
                          height: 240,
                        ),
                      ),

                      // 🟢 Vòng tròn ngoài
                      Container(
                        width: 201,
                        height: 201,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF269E38),
                            width: 27,
                          ),
                        ),
                      ),

                      // ⚪ Vòng tròn trong
                      Container(
                        width: 147,
                        height: 147,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),

                      // 🔢 Chữ 100% ở giữa
                      const Text(
                        '100%',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF269E38),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: const Text(
                        'Tổng điểm: 100/100',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF269E38),
                        ),
                      ),
                    ),
                  ),
                   // 🔻 Thanh ngang nằm bên dưới
                  Container(
                    width: double.infinity, // hoặc MediaQuery.of(context).size.width
                    height: 9,
                    margin: const EdgeInsets.symmetric(horizontal: 32), // cho đẹp, bo nhẹ 2 bên
                    decoration: BoxDecoration(
                      color: const Color(0xFF269E38),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.only(top: 16, bottom: 32),
                      children: [
                        TaskItem('assets/12_18/map_1/bg_task_1.png', 'Nhiệm vụ 1', 'Định nghĩa và phân loại', const Color(0xFF9874FF)),
                        TaskItem('assets/12_18/map_1/bg_task_2.png', 'Nhiệm vụ 2', 'Nhận dạng ma tuý phổ biển', const Color(0xFFE87C1D)),
                        TaskItem('assets/12_18/map_1/bg_task_3.png', 'Nhiệm vụ 3', 'Nhận dạng ma tuý trá hình', const Color(0xFFE8A13D)),
                        TaskItem('assets/12_18/map_1/bg_task_4.png', 'Nhiệm vụ 4', 'Kỹ thuật giám định', const Color(0xFF21D99F)),
                        // ➕ Thêm các component khác bằng cách copy dòng trên và thay đổi hình
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}