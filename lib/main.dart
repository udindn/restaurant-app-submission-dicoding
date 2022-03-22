import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_button/like_button.dart';
import 'detail_screen.dart';

List _items = [];
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UdinDn.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SecondScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        color: Colors.amber,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Center(
                  child: Icon(
                Icons.shopping_bag_outlined,
                size: 80,
                color: Colors.white,
              )),
            ]));
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Restaurant',
        ),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("assets/local_restaurant.json"),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          var data = json.decode(snapshot.data.toString());
          return FilmList(
            items: data["restaurants"],
          );
        },
      ),
    );
  }
}

class FilmList extends StatelessWidget {
  final List items;

  const FilmList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailScreen(data: items, indeks: index);
                }));
              },
              child: IntrinsicHeight(
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(
                      top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(items[index]["pictureId"],
                            height: 100, width: 150, fit: BoxFit.fill),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          items[index]["name"],
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: <Widget>[
                                          const Icon(
                                            Icons.location_on,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 8.0),
                                          Text(
                                            items[index]["city"],
                                            style: const TextStyle(
                                                fontFamily: 'Oxygen',
                                                fontSize: 14.0),
                                          ),
                                          const SizedBox(width: 8.0)
                                        ]),
                                      ])),
                              Expanded(
                                  child: ClipRRect(
                                      child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Row(children: <Widget>[
                                            Expanded(
                                                child: Row(children: <Widget>[
                                              const Icon(
                                                Icons.star,
                                                size: 16,
                                                color: Colors.amber,
                                              ),
                                              const SizedBox(width: 8.0),
                                              Text(
                                                items[index]["rating"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontFamily: 'Oxygen',
                                                    fontSize: 14.0),
                                              ),
                                              const SizedBox(width: 8.0),
                                            ])),
                                            const FavoriteButton()
                                          ]))))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
        itemCount: items.length,
      ),
    );
  }
}

class FilmGrid extends StatelessWidget {
  final int gridCount;

  const FilmGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: _items.map((item) {
            return InkWell(
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        item["name"],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 8.0),
                      child: Text(
                        item["name"] + " (" + item["name"] + ")",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 8.0),
                            const Icon(Icons.star, color: Colors.yellow),
                            const SizedBox(width: 8.0),
                            Text(
                              item["name"],
                              style: const TextStyle(
                                  fontFamily: 'Oxygen', fontSize: 12.0),
                            ),
                            const SizedBox(width: 8.0),
                          ],
                        ),
                        const SizedBox(width: 8.0),
                        Row(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const SizedBox(width: 8.0),
                                const Icon(Icons.alarm),
                                const SizedBox(width: 8.0),
                                Text(
                                  item["name"],
                                  style: const TextStyle(
                                      fontFamily: 'Oxygen', fontSize: 12.0),
                                ),
                                const SizedBox(width: 8.0),
                              ],
                            ),
                            const SizedBox(width: 8.0),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return LikeButton(
        size: 14.0,
        circleColor: const CircleColor(
            start: Color.fromARGB(255, 255, 17, 0),
            end: Color.fromARGB(255, 255, 17, 0)),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: Color.fromARGB(255, 255, 17, 0),
          dotSecondaryColor: Color.fromARGB(255, 255, 17, 0),
        ),
        likeBuilder: (bool isLiked) {
          return Icon(
            isLiked ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: 18.0,
          );
        });
  }
}
