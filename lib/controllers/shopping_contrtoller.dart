import 'package:get/get.dart';
import 'package:getx_tutr/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var serverResponse = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about the product',
          productImage: 'abd',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about the product',
          productImage: 'abd',
          productName: 'SecondProd'),
      Product(
          id: 3,
          price: 49.1,
          productDescription: 'some description about the product',
          productImage: 'abd',
          productName: 'ThirdProd'),
    ];
    products.value = serverResponse;
  }
}
