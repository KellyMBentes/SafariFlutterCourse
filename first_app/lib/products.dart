import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(
    this.products,
  ) {
    print("[Product Widget] Constructor");
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(children: <Widget>[
        Image.asset(products[index]["image"]),
        Text(products[index]["title"]),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("Details"),
              onPressed: () => Navigator.pushNamed<bool>(
                          context, "/product/" + index.toString())
                      .then((bool value) {
                    if (value) {}
                  }),
            ),
          ],
        )
      ]),
    );
  }

  Widget _buildProductList() {
    Widget productCard;

    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCard = Center(
        child: Text("No Products Found Please Add Some"),
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    print("[Product Widget] build()");
    return _buildProductList();
  }
}
