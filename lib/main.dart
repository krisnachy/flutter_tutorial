import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Material app adalah widget yg berisi data-data yg diperlukan oleh app yg menggunakan material design
    return MaterialApp(
        //tampilan awal yang akan ditampilkan oleh material app
        home: BlocProvider(
      builder: (context) => ProductBloc(),
      child: MainPage(),
    ));
  }
}

class MainPage extends StatelessWidget {
  final Random r = Random();

  @override
  Widget build(BuildContext context) {
    ProductBloc bloc = BlocProvider.of<ProductBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Builder"),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: () {
              bloc.dispatch(r.nextInt(4) + 2);
            },
          ),
          BlocBuilder<ProductBloc, List<Product>>(
            builder: (context, products) {
              return Expanded(
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Text(index.toString());
                    }),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Product {
  String imageUrl;
  String name;
  int price;

  Product({this.imageUrl = "", this.name = "", this.price = 0});
}

class ProductBloc extends Bloc<int, List<Product>> {
  @override
  List<Product> get initialState => [];

  @override
  Stream<List<Product>> mapEventToState(int event) async* {
    List<Product> products = [];
    for (var i = 0; i < event; i++) {
      products.add(Product(
          imageUrl: 'urlimage',
          name: 'Produk ' + i.toString(),
          price: (i + 1) * 5000));
      yield products;
    }
  }
}
