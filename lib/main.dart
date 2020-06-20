import 'package:flutter/material.dart';

import 'components/product_box.dart';
import 'model/product.dart';
import 'pages/product_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final items = Product.getProducts();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: ProductBox(item: widget.items[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductPage(item: widget.items[index]),
                  ),
                );
              },
            );
          },
        ));
  }
}
