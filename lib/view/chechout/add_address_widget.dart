import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/core/view_model/checkout_viewmodel.dart';
import 'package:shoping/view/chechout/checkout_view.dart';
import 'package:shoping/view/widgets/custom_text.dart';
import 'package:shoping/view/widgets/custom_text_form_field.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find(),
      builder: (controller)=>Form(
        key: controller.formState,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                SizedBox(height:40 ,),
                CustomText(
                  text: 'Billing address is the same as delivery address',
                  fontSize: 16,
                  alignment: Alignment.center,
                ),
                SizedBox(height:30 ,),
                  CustomTextFormField(
                    text: 'Street 1',
                    hint: '21, Alex Davidson Avenue',
                    onSave: (value){controller.street1 = value;},
                    validator: (String value){if(value.isEmpty){
                        return 'you must write your street';}},

                  ),
                  SizedBox(height:30 ,),
                  CustomTextFormField(
                    text: 'Street 2',
                    hint: 'Opposite Omegatron, Vicent Quarters',
                    onSave: (value){controller.street2 = value;},
                    validator: (String value){if(value.isEmpty){
                      return 'you must write your street 2';}},
                  ),
                  SizedBox(height:30 ,),
                  CustomTextFormField(
                    text: 'City',
                    hint: 'Victoria Island',
                    onSave: (value){controller.city = value;},
                    validator: (String value){if(value.isEmpty){
                      return 'you must write your City';}},
                  ),
                  SizedBox(height:30 ,),
                  Container(
                    width: Get.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20,),
                            child: CustomTextFormField(
                              text: 'State',
                              hint: 'Lagos State',
                              onSave: (value){controller.state = value;},
                              validator: (String value){if(value.isEmpty){
                                return 'you must write your state';}},
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,),
                            child: CustomTextFormField(
                              text: 'Country',
                              hint: 'Nigeria',
                              onSave: (value){controller.country = value;},
                              validator: (String value){if(value.isEmpty){
                                return 'you must write your Country';}},
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
