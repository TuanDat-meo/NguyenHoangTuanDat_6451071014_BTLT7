import 'dart:convert'; // Để dùng json.decode
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  // Base URL có thể để ở đây hoặc trong thư mục apps/
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> fetchUsers() async {
    try {
      // Thực hiện lệnh GET API
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        // Nếu server trả về 200 OK, tiến hành parse dữ liệu
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        // Xử lý khi server trả về lỗi (404, 500...)
        throw Exception('Lỗi hệ thống: ${response.statusCode}');
      }
    } catch (e) {
      // Xử lý lỗi kết nối mạng
      throw Exception('Không có kết nối Internet hoặc lỗi: $e');
    }
  }
}