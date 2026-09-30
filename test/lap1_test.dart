import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/lap1.dart'; // Đảm bảo đường dẫn này đúng

void main() {
  testWidgets('Lab 1: Kiểm tra tiêu đề I Am Rich', (WidgetTester tester) async {
    await tester.pumpWidget(const IAmRichApp());
    // Kiểm tra xem chữ 'I Am Rich' có xuất hiện không
    expect(find.text('I Am Rich'), findsOneWidget);
    // Kiểm tra xem có Widget hình ảnh không
    expect(find.byType(Image), findsOneWidget);
  });
}