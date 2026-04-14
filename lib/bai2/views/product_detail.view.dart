import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../utils/api_service.dart';
import '../widgets/product_info.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết sản phẩm'),
        centerTitle: true,
      ),
      body: FutureBuilder<Product>(
        // Gọi API lấy sản phẩm ID số 1
        future: ApiService.fetchProductDetail(1),
        builder: (context, snapshot) {
          // 1. Trạng thái đang tải
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Trạng thái có dữ liệu
          if (snapshot.hasData && snapshot.data != null) {
            final p = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Hiển thị hình ảnh từ Network
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      p.image,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Widget thông tin chi tiết đã tách riêng
                  ProductInfo(
                    title: p.title,
                    price: p.price,
                    description: p.description,
                  ),
                  
                  const Divider(height: 40),
                  // Thông tin sinh viên
                  const Text(
                    "Nguyễn Hoàng Tuấn Đạt - 6451071014",
                    style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          // 3. Trạng thái lỗi hoặc không có dữ liệu
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 60),
                const SizedBox(height: 10),
                const Text('Lỗi tải dữ liệu sản phẩm'),                
              ],
            ),
          );
        },
      ),
    );
  }
}