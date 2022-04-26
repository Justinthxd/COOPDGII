import 'package:final_app/pages/sub_descuentos.dart';
import 'package:final_app/resource/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/api.dart';
import '../provider/provider.dart';

class Descuentos extends StatefulWidget {
  Descuentos({Key? key}) : super(key: key);

  @override
  State<Descuentos> createState() => _DescuentosState();
}

class _DescuentosState extends State<Descuentos> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  API api = API();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final main = Provider.of<MainProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(10),
        child: FloatingActionButton(
          backgroundColor: main.getIsDark
              ? Colors.lightGreen.withOpacity(0.7)
              : Colors.green,
          onPressed: () {},
          child: const Icon(
            Icons.edit_rounded,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: main.getIsDark
                ? const Color.fromRGBO(20, 20, 20, 1)
                : const Color.fromRGBO(245, 245, 245, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.08),
                Expanded(
                  child: FutureBuilder(
                    future: api.descuentos(main.getToken),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          itemCount: snapshot.data.length,
                          separatorBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              height: 15,
                              thickness: 2,
                              color: main.getIsDark
                                  ? Colors.white.withOpacity(0.1)
                                  : Colors.black.withOpacity(0.01),
                            ),
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        SubDescuentos(
                                            mes: snapshot.data[index]
                                                ['mes_str']),
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    transitionsBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: main.getIsDark
                                      ? const Color.fromRGBO(20, 20, 20, 1)
                                      : const Color.fromRGBO(245, 245, 245, 1),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: main.getIsDark
                                          ? const Color.fromRGBO(30, 30, 30, 1)
                                          : const Color.fromRGBO(
                                              250, 250, 250, 1),
                                      offset: const Offset(-3.0, -3.0),
                                    ),
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: main.getIsDark
                                          ? const Color.fromRGBO(10, 10, 10, 1)
                                          : const Color.fromRGBO(
                                              235, 235, 235, 1),
                                      offset: const Offset(3.0, 3.0),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 20,
                                      child: Transform.rotate(
                                        angle: 1,
                                        child: Container(
                                          height: 100,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: main.getIsDark
                                                ? const Color.fromARGB(
                                                    255, 29, 29, 34)
                                                : Colors.lightGreenAccent
                                                    .withOpacity(0.1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 70,
                                      right: 0,
                                      child: Transform.rotate(
                                        angle: 1,
                                        child: Container(
                                          height: 100,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: main.getIsDark
                                                ? const Color.fromARGB(
                                                    255, 29, 29, 34)
                                                : Colors.lightGreenAccent
                                                    .withOpacity(0.1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  snapshot.data[index]
                                                      ['mes_str'],
                                                  style: TextStyle(
                                                    color: main.getIsDark
                                                        ? Colors.white
                                                        : Colors.black
                                                            .withOpacity(0.7),
                                                    fontSize: 35,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  snapshot.data[index]['ano'],
                                                  style: TextStyle(
                                                    color: main.getIsDark
                                                        ? Colors.white
                                                        : Colors.black45,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: main.getIsDark
                                              ? Colors.white24
                                              : Colors.black12,
                                          thickness: 2,
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Text(
                                              "Descuentos en " +
                                                  snapshot.data[index]
                                                      ['mes_str'] +
                                                  ": ",
                                              style: TextStyle(
                                                color: main.getIsDark
                                                    ? Colors.white60
                                                    : Colors.black54,
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "#" +
                                                  snapshot
                                                      .data[index]['det'].length
                                                      .toString(),
                                              style: TextStyle(
                                                color: main.getIsDark
                                                    ? Colors.white60
                                                    : Colors.black54,
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 18,
            top: 18,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: main.getIsDark ? Colors.white : Colors.black54,
                    size: 30,
                  ),
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
                const SizedBox(width: 10),
                Text(
                  "Descuentos",
                  style: TextStyle(
                    color: main.getIsDark ? Colors.white : Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
