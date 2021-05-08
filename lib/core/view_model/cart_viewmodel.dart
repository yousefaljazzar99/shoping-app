import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping/core/services/database/cart_database_helper.dart';
import 'package:shoping/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;
  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var dbHelper = CartDatabaseHelper.db;

  CartViewModel(){
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProduct();
    _loading.value = false;
    print(_cartProductModel.length);
    getTotalPrice();

    update();
  }
  getTotalPrice(){
    for(int i = 0;i<_cartProductModel.length;i++){
      _totalPrice +=(double.parse(_cartProductModel[i].price)*_cartProductModel[i].quantity);
      print(_totalPrice);
      update();

    }
  }

  addProduct(CartProductModel cartProductModel) async {

      for(int i =0;i<_cartProductModel.length;i++){
        if(_cartProductModel[i].productId==cartProductModel.productId){
          return;
        }
      }
      await dbHelper.inser(cartProductModel);
      _cartProductModel.add(cartProductModel);
      _totalPrice +=(double.parse(cartProductModel.price)*cartProductModel.quantity);


    update();
  }
increaseQuantity(int index)async{
    _cartProductModel[index].quantity++;
    _totalPrice +=(double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
}
  decreaseQuantity(int index)async{
    _cartProductModel[index].quantity--;
    _totalPrice -=(double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);

    update();
  }

}
