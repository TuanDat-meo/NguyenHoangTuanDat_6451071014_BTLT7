import 'dart:convert'; // Để dùng json.decode
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ApiService {
  // Base URL có thể để ở đây hoặc trong thư mục apps/
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  static Future<Product> fetchProductDetail(int id) async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));

    if (response.statusCode == 200) {
      // Vì trả về 1 object nên dùng json.decode trực tiếp vào Map
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Không tìm thấy sản phẩm');
    }
  }
}