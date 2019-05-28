import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return ProductCreatePageState();
  }
}

class ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = "";
  String _description = "";
  double _priceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "Poduct Title",
            ),
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Poduct Description",
            ),
            maxLines: 4,
            onChanged: (String value) {
              setState(() {
                _description = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Poduct Price",
            ),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                _priceValue = double.parse(value);
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            child: Text("Save"),
            textColor: Colors.white,
            onPressed: () {
              final Map<String, dynamic> product = {
                "title": _titleValue,
                "description": _description,
                "price": _priceValue,
                "image": "assets/food.jpg"
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed (context, "/products");
            },
          )
        ],
      ),
    );
  }
}
