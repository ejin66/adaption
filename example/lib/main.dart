import 'package:adaption/adaption.dart';
import 'package:flutter/material.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Adaption Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (context) {

      	Adaption.design(context, 1080, 1920);

      	return Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						Container(
							width: 0.2.ratio(),
							height: 0.2.ratioHeight(),
							color: Colors.red,
						),
						Container(
							width: 0.4.ratio(),
							height: 0.2.ratioHeight(),
							color: Colors.green,
						),
						Container(
							width: 0.6.ratio(),
							height: 0.2.ratioHeight(),
							color: Colors.blue,
						),
						Container(
							width: 0.8.ratio(),
							height: 0.2.ratioHeight(),
							color: Colors.orange,
						),
						Container(
							width: 1.0.ratio(),
							height: 0.2.ratioHeight(),
							color: Colors.purple,
						),
					],
				);
			}),
    );
  }
}

