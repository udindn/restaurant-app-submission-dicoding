import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'menu.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final List data;
  final int indeks;

  const DetailScreen({Key? key, required this.data, required this.indeks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // if (constraints.maxWidth > 800) {
        //   return DetailWebPage(data: data, indeks: indeks);
        // } else {
        return DetailMobilePage(data: data, indeks: indeks);
        // }
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final List data;
  final int indeks;

  const DetailMobilePage({Key? key, required this.data, required this.indeks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(data[indeks]["pictureId"]),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text(
                data[indeks]["name"],
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Icon(Icons.location_on),
                  const SizedBox(width: 8.0),
                  Text(
                    data[indeks]["city"],
                    style: informationTextStyle,
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 16.0),
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                child: const Text("Synopsis",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold))),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                data[indeks]["description"],
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 8.0),
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                child: const Text("Menus",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.bold))),
            Container(
                margin: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: IntrinsicHeight(
                          child: Stack(
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.transparent,
                            onTap: () => {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MenuScreen(
                                    data: data, indeks: indeks, type: 1);
                              }))
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    offset: const Offset(2.5, 2.5),
                                    blurRadius: 16,
                                  ),
                                ],
                              ),
                              margin: const EdgeInsets.all(2),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                child: Image.network(
                                  "https://idsb.tmgrup.com.tr/ly/uploads/images/2021/01/27/88730.jpg",
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20, bottom: 20),
                            child: const Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Food Menu',
                                  style: TextStyle(shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(5.0, 5.0),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                    Shadow(
                                      offset: Offset(5.0, 5.0),
                                      blurRadius: 8.0,
                                      color: Color.fromARGB(125, 0, 0, 255),
                                    ),
                                  ], color: Colors.white, fontSize: 20),
                                )),
                          ),
                        ],
                      )),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                        flex: 1,
                        child: IntrinsicHeight(
                            child: Stack(
                          children: <Widget>[
                            InkWell(
                              splashColor: Colors.transparent,
                              onTap: () => {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MenuScreen(
                                      data: data, indeks: indeks, type: 2);
                                }))
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.6),
                                      offset: const Offset(2.5, 2.5),
                                      blurRadius: 16,
                                    ),
                                  ],
                                ),
                                margin: const EdgeInsets.all(2),
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    child: Image.network(
                                      "https://static.onecms.io/wp-content/uploads/sites/44/2021/06/09/recipe-red-drink.jpg",
                                    )),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 20, bottom: 20),
                              child: const Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Drink Menu',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(5.0, 5.0),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                        Shadow(
                                          offset: Offset(5.0, 5.0),
                                          blurRadius: 8.0,
                                          color: Color.fromARGB(125, 0, 0, 255),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ))),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final List data;
  final int indeks;

  const DetailWebPage({Key? key, required this.data, required this.indeks})
      : super(key: key);

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: kIsWeb ? null : AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 64,
            ),
            child: Center(
              child: SizedBox(
                width: screenWidth <= 1200 ? 800 : 1200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Detail Restaurant',
                      style: TextStyle(
                        fontFamily: 'Staatliches',
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.network(
                                    widget.data[widget.indeks]["pictureId"]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 32),
                        Expanded(
                          child: Card(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    widget.data[widget.indeks]["name"],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 30.0,
                                      fontFamily: 'Staatliches',
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          const Icon(
                                              Icons.production_quantity_limits),
                                          const SizedBox(width: 8.0),
                                          Text(
                                            widget.data[widget.indeks]["name"],
                                            style: informationTextStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.language),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        widget.data[widget.indeks]["name"],
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.date_range),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        widget.data[widget.indeks]["name"],
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.star),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        widget.data[widget.indeks]["name"],
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.alarm),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        widget.data[widget.indeks]["name"],
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: Text(
                                      widget.data[widget.indeks]["name"],
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Oxygen',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
