import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_http_request_demo/models/products_mode;.dart';
import 'package:flutter_http_request_demo/pages/detail_page.dart';
import 'package:flutter_http_request_demo/services/network_service.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductElement> productList = [];

  @override
  void initState() {
    super.initState();
    _getApi();
  }

  void _getApi() async {
    var response = await NetworkService.GET(NetworkService.apiGet);
    Product product = Product.fromJson(jsonDecode(response));
    productList = product.products;
  }

  Widget circular() {
    return const CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return eachProduct(productList[index]);
        }),
        itemCount: productList.length,
      ),
    );
  }

  Widget eachProduct(ProductElement product) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                    title: product.title, subtitle: product.price.toString())));
      },
      child: Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                padding: EdgeInsets.zero,
                onPressed: doNothing,
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                spacing: 1,
                autoClose: true,
              )
            ],
          ),
          child: ListTile(
            title: Text(
              product.title,
              style: TextStyle(fontSize: 21),
            ),
            subtitle: Text(
              '${product.price.toString()}\$',
              style: TextStyle(fontSize: 17),
            ),
          )),
    );
  }

  void doNothing(BuildContext context) {}
}
