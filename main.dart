import 'dart:io';

void main() {
  // 상품 목록 생성 (생성자 사용)
  List<Product> products = [
    Product("셔츠", 45000),
    Product("원피스", 30000),
    Product("반팔티", 35000),
    Product("반바지", 38000),
    Product("양말", 5000),
  ];

  // 장바구니 생성
  List<Product> cart = [];

  while (true) {
    // 메뉴 출력
    print(
      "[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료",
    );

    // 사용자 입력 받기
    String? input = stdin.readLineSync();

    // 입력 처리
    if (input == "1") {
      showProductList(products);
    } else if (input == "2") {
      addToCart(products, cart);
    } else if (input == "3") {
      showCartTotal(cart);
    } else if (input == "4") {
      print("이용해 주셔서 감사합니다~ 안녕히 가세요!");
      break;
    } else {
      print("지원하지 않는 기능입니다! 다시 시도해 주세요.");
    }
  }
}

// 상품 클래스
class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

// 상품 목록 보기 함수
void showProductList(List<Product> products) {
  print("상품 목록:");
  for (int i = 0; i < products.length; i++) {
    print("${i + 1}. ${products[i].name} (${products[i].price}원)");
  }
}

// 장바구니에 담기 함수 수정
void addToCart(List<Product> products, List<Product> cart) {
  stdout.write("상품 이름을 입력해 주세요! ");
  String? productName = stdin.readLineSync();
  stdout.write("상품 개수를 입력해 주세요! ");
  String? quantityStr = stdin.readLineSync();

  try {
    int quantity = int.parse(quantityStr!);
    if (quantity <= 0) {
      print("0개보다 많은 개수의 상품만 담을 수 있어요!");
      return;
    }

    Product? selectedProduct;
    for (Product product in products) {
      if (product.name == productName) {
        selectedProduct = product;
        break;
      }
    }

    if (selectedProduct != null) {
      for (int i = 0; i < quantity; i++) {
        cart.add(selectedProduct);
      }
      print("장바구니에 상품이 담겼어요!");
    } else {
      print("상품을 찾을 수 없습니다.");
    }
  } catch (e) {
    print("입력값이 올바르지 않아요!");
  }
}

// 장바구니에 담긴 상품의 총 가격 보기 함수 수정
void showCartTotal(List<Product> cart) {
  int total = 0;
  for (Product product in cart) {
    total += product.price;
  }
  print("장바구니에 ${total}원 어치를 담으셨네요!");
}
