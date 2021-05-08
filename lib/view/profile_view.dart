import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/constasce.dart';
import 'package:shoping/core/view_model/profile_view_model.dart';
import 'package:shoping/view/auth/login_view.dart';
import 'package:shoping/view/widgets/custom_text.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder:(controller)=>controller.loading.value
          ? Center(child: CircularProgressIndicator(),)
          : Scaffold(
        body:Container(
          padding: EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                         decoration: BoxDecoration(
                           color: primaryColor,
                             borderRadius : BorderRadius.all(Radius.circular(100),
                             ),
                           image: DecorationImage(
                             image: controller.userModel==null
                                 ? AssetImage('assets/images/avataar.png',
                             )
                                 :controller.userModel.pic=='default'
                               ? AssetImage('assets/images/avataar.png')
                               : NetworkImage(controller.userModel.pic,
                           ),
                             fit: BoxFit.fill,
                           ),
                      ),
                      ),
                      Column(
                        children: [
                          CustomText(
                            text: controller.userModel.name,
                            color: Colors.black,
                            fontSize: 28,
                          ),
                          CustomText(
                            text: controller.userModel.email,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 90,),
                Container(
                  child: FlatButton(
                    onPressed: (){},
                    child: ListTile(
                      title: CustomText(
                        text: 'Edit Profile',
                      ),
                      leading: Image.asset("assets/menu_icon/edit.png",
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: FlatButton(
                    onPressed: (){},
                    child: ListTile(
                      title: CustomText(
                        text: 'Shipping Address',
                      ),
                      leading: Image.asset("assets/menu_icon/map.png",
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: FlatButton(
                    onPressed: (){},
                    child: ListTile(
                      title: CustomText(
                        text: 'Order History',
                      ),
                      leading: Image.asset("assets/menu_icon/his.png",
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: FlatButton(
                    onPressed: (){},
                    child: ListTile(
                      title: CustomText(
                        text: 'Cards',
                      ),
                      leading: Image.asset("assets/menu_icon/cart.png",
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: FlatButton(
                    onPressed: (){},
                    child: ListTile(
                      title: CustomText(
                        text: 'Notifications',
                      ),
                      leading: Image.asset("assets/menu_icon/not.png",
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: FlatButton(
                    onPressed: (){
                      controller.signOut();
                      Get.offAll(LoginView());
                    },
                    child: ListTile(
                      title: CustomText(
                        text: 'Log Out',
                      ),
                      leading: Image.asset("assets/menu_icon/logout.png",
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
              ],
            ),
          )),
      ),
    );
  }
}
