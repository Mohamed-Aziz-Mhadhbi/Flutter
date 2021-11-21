import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  //var
  final String _image;
  final String _title;
  final String _description;
  final int _price;
  final int _quantity;

  //constructor
  ProductDetails(
      this._image, this._title, this._description, this._price, this._quantity,
      {Key? key})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  //var
  late int _CurrentQuantity;

  //life cycle
  @override
  void initState() {
    super.initState();
    _CurrentQuantity = widget._quantity;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Image.asset(widget._image, width: 460, height: 215)),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
            child: Text(widget._description),
          ),
          Text(widget._price.toString() + " TND", textScaleFactor: 3),
          const SizedBox(
            height: 50,
          ),
          Text(_CurrentQuantity.toString() + "  Restantes"),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.shopping_basket_rounded),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Acheter", textScaleFactor: 2)
                ],
              ),
              onPressed: () {
                //Listener
                setState(() {
                  _CurrentQuantity--;
                  print('CurrentQuantity == ' + _CurrentQuantity.toString());
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
