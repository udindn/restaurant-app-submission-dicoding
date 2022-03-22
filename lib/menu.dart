import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuScreen extends StatelessWidget {
  final List data;
  final int indeks;
  final int type;

  const MenuScreen(
      {Key? key, required this.data, required this.indeks, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'Menu',
          ),
        ),
        body: FutureBuilder(
          future: rootBundle.loadString("assets/local_restaurant.json"),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            var data = json.decode(snapshot.data.toString());
            if (type == 1) {
              return MenuList(
                  items: data["restaurants"][indeks]["menus"]["foods"]);
            } else {
              return MenuList(
                  items: data["restaurants"][indeks]["menus"]["drinks"]);
            }
          },
        ));
  }
}

class MenuList extends StatelessWidget {
  final List items;

  const MenuList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return InkWell(
            child: IntrinsicHeight(
          child: Container(
            margin: const EdgeInsets.only(top: 8.0),
            color: Colors.white,
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
            child: Row(children: <Widget>[
              const Icon(
                Icons.restaurant_menu,
                size: 14,
              ),
              const SizedBox(width: 8.0),
              Expanded(
                  child: Text(
                items[index]["name"],
                style: const TextStyle(fontFamily: 'Oxygen', fontSize: 16.0),
              )),
              const SizedBox(width: 8.0),
              const BaseketButton(),
            ]),
          ),
        ));
      },
      itemCount: items.length,
    );
  }
}

class BaseketButton extends StatefulWidget {
  const BaseketButton({Key? key}) : super(key: key);

  @override
  _BaseketButtonState createState() => _BaseketButtonState();
}

class _BaseketButtonState extends State<BaseketButton> {
  bool isAdd = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isAdd ? Icons.cancel : Icons.shopping_basket,
        color: Colors.amber,
      ),
      onPressed: () {
        setState(() {
          isAdd = !isAdd;
        });
      },
    );
  }
}
