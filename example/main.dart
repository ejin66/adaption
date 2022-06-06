import 'package:adaption/adaption.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Adaption Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (context) {
        MediaQuery.of(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 0.2.w,
              height: 0.2.h,
              color: Colors.red,
            ),
            Container(
              width: 0.4.w,
              height: 0.2.h,
              color: Colors.green,
            ),
            Container(
              width: 0.6.w,
              height: 0.2.h,
              color: Colors.blue,
            ),
            Container(
              width: 0.8.w,
              height: 0.2.h,
              color: Colors.orange,
            ),
            Container(
              width: 1.0.w,
              height: 0.2.h,
              color: Colors.purple,
            ),
          ],
        );
      }),
    );
  }
}
