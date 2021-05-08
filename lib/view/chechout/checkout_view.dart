import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/constasce.dart';
import 'package:shoping/core/view_model/checkout_viewmodel.dart';
import 'package:shoping/helper/enum.dart';
import 'package:shoping/view/chechout/add_address_widget.dart';
import 'package:shoping/view/chechout/delevery_time_widget.dart';
import 'package:shoping/view/chechout/summary_widget.dart';
import 'package:shoping/view/widgets/custum_button.dart';
import 'package:status_change/status_change.dart';

class CheckOutView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) =>
          Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text(
                "CheckOut",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Container(
                  height: 100,
                  child: StatusChange.tileBuilder(
                    theme: StatusChangeThemeData(
                      direction: Axis.horizontal,
                      connectorTheme: ConnectorThemeData(
                          space: 1.0, thickness: 1.0),
                    ),
                    builder: StatusChangeTileBuilder.connected(
                      itemWidth: (_) =>
                      MediaQuery
                          .of(context)
                          .size
                          .width / _processes.length,
                      nameWidgetBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            _processes[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: controller.getColor(index),
                            ),
                          ),
                        );
                      },
                      indicatorWidgetBuilder: (_, index) {
                        if (index <= controller.index) {
                          return DotIndicator(
                            size: 35.0,
                            border: Border.all(color: Colors.green, width: 1),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return OutlinedDotIndicator(
                            size: 30,
                            borderWidth: 1.0,
                            color: todoColor,
                          );
                        }
                      },
                      lineWidgetBuilder: (index) {
                        if (index > 0) {
                          if (index == controller.index) {
                            final prevColor = controller.getColor(index - 1);
                            final color = controller.getColor(index);
                            var gradientColors;
                            gradientColors = [
                              prevColor,
                              Color.lerp(prevColor, color, 0.5)
                            ];
                            return DecoratedLineConnector(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: gradientColors,
                                ),
                              ),
                            );
                          } else {
                            return SolidLineConnector(
                              color: controller.getColor(index),
                            );
                          }
                        } else {
                          return null;
                        }
                      },
                      itemCount: _processes.length,
                    ),
                  ),
                ),
                controller.pages == Pages.DeliveryTime
                    ? DeliveryTime()
                    : controller.pages == Pages.AddAddress
                    ? AddAddress()
                    : Summary(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    controller.index==0
                        ? Container ()
                        : Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 200,
                        height: 100,
                        padding: EdgeInsets.all(20),

                        child: CustomButton(
                          onPress: (){
                            controller.changeIndex(controller.index - 1 );
                          },
                          color: Colors.white,
                          textColor: primaryColor,
                          text: 'Back',
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 200,
                        height: 100,
                        padding: EdgeInsets.all(20),

                        child: CustomButton(
                            onPress: (){
                              controller.changeIndex(controller.index + 1 );
                            },
                           text: 'NEXT',
                        ),
                      ),
                    ),

                  ],
                ),

              ],
            ),
            
          ),
    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summer',
];