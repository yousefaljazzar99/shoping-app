import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping/view/control_view.dart';
import 'package:path/path.dart';

import 'core/view_model/cart_viewmodel.dart';
import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: ControlView(),
      ),
      theme: ThemeData(
        fontFamily: 'SourceSans',
      ),
    );
  }
}
