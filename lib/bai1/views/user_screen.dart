import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../utils/api_service.dart';
import '../widgets/user_card.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key}); // Thêm const constructor đúng chuẩn

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: ApiService.fetchUsers(),
        builder: (context, snapshot) {
          // 1. Trạng thái đang tải
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Trạng thái có dữ liệu thành công
          if (snapshot.hasData && snapshot.data != null) {
            return Column(
              children: [
                // Hiển thị danh sách user
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final user = snapshot.data![index];
                      return UserCard(name: user.name, email: user.email);
                    },
                  ),
                ),
                
                // Hiển thị thông tin sinh viên ở dưới cùng danh sách
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: const [
                      Divider(),
                      Text(
                        "Nguyễn Hoàng Tuấn Đạt - 6451071014",
                        style: TextStyle(
                          fontStyle: FontStyle.italic, 
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            );
          }

          // 3. Trạng thái lỗi
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.wifi_off, size: 50, color: Colors.red),
                SizedBox(height: 10),
                Text('Lỗi kết nối API!'),
              ],
            ),
          );
        },
      ),
    );
  }
}