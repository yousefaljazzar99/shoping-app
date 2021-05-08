import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shoping/constasce.dart';
import 'package:shoping/core/view_model/cart_viewmodel.dart';
import 'package:shoping/view/widgets/custom_text.dart';
import 'package:shoping/view/widgets/custum_button.dart';

import 'chechout/checkout_view.dart';

class CartView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: Get.find(),
    builder:(controller)=> Scaffold(
      body: controller.cartProductModel.length ==0
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/cart_empty.svg',
            width: 200,
            height: 200,
          ),
          SizedBox(height: 20,
          ),
          CustomText(
            text: 'Cart Empty!',
            fontSize: 32,
            alignment: Alignment.topCenter,
            color: primaryColor,

          ),
        ],
      )
          : Column(
        children: [
          Expanded(
            child:  Container(
                  child: ListView.separated(
                    itemBuilder: (context,index){
                      return Container(
                        height:140,
                        child: Row(
                         children: [
                           Container(
                             width: 140,
                             child: Image.network(
                               controller.cartProductModel[index].image,
                               fit: BoxFit.fill,
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 30,),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SizedBox(height: 20,
                                 ),
                                 CustomText(
                                   text: controller.cartProductModel[index].name,
                                   fontSize: 18,
                                 ),
                                 SizedBox(height: 10,
                                 ),
                                 CustomText(
                                   color: primaryColor,
                                   text: "${controller.cartProductModel[index].price.toString()}  NIS",
                                 ),
                                 SizedBox(height: 20,
                                 ),
                                 Container(
                                   width: 140,
                                   color: Colors.grey.shade200,
                                   height: 40,
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       GestureDetector(
                                         child: Icon(
                                           Icons.add,
                                           color: Colors.black,
                                         ),
                                         onTap:(){
                                           controller.increaseQuantity(index);
                                         } ,
                                       ),
                                       SizedBox(width: 20,),
                                       CustomText(
                                         text: controller.cartProductModel[index].quantity.toString(),
                                         alignment: Alignment.center,
                                         fontSize: 20,
                                         color: Colors.black,),
                                       SizedBox(width: 20,),
                                       GestureDetector(
                                         onTap:(){
                                           controller.decreaseQuantity(index);
                                         },
                                         child: Container(

                                           padding: EdgeInsets.only(bottom: 20),
                                           child: Icon(
                                             Icons.minimize,
                                             color: Colors.black,
                                           ),
                                         ),
                                       ),

                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           )
                         ],
                        ));
                    },
                      itemCount:controller.cartProductModel.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 15,
                      );
                  },
                    ),
                     ),

          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(text: 'TOTAL', fontSize: 22,color: Colors.grey,),
                    SizedBox(height: 15,),
                    GetBuilder<CartViewModel>(
                      init: Get.find(),
                        builder:(controller)=>CustomText(
                          text: '${controller.totalPrice}  NIS',
                          color: primaryColor,
                          fontSize: 24
                          ,)),
                  ],
                ),
              Container(
                padding: EdgeInsets.all(20),
                height: 100,
                width: 180,
                child: CustomButton(
                  onPress: (){
                    Get.to(CheckOutView());
                  },
                    text: 'CHECKOUT',
                    ),
              )
              ],
            ),
          )
        ],
      ),
      ),);
  }
}
