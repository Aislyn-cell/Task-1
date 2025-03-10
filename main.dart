import 'dart:io';

void main() {
  List<Map<String, dynamic>> products = [
    {'name': '셔츠', 'price': 45000},
    {'name': '원피스', 'price': 30000},
    {'name': '반팔티', 'price': 35000},
    {'name': '반바지', 'price': 38000},
    {'name': '양말', 'price': 5000},
  ];

  while (true) {
    print('원하는 기능을 선택하세요.');
    print('1. 상품 목록 보기');
    print('2. 종료');

    String? input = stdin.readLineSync();

    if (input == '1') {
      showProductList(products);
    } else if (input == '2') {
      print('쇼핑몰을 종료합니다.');
      break;
    } else {
      print('잘못된 입력입니다. 다시 입력해주세요.');
    }
  }
}

void showProductList(List<Map<String, dynamic>> products) {
  print('[상품 목록]');
  for (var product in products) {
    print('${product['name']} / ${product['price']}원');
  }
}
