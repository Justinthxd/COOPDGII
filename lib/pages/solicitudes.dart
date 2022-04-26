import 'package:final_app/resource/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../data/api.dart';
import '../provider/provider.dart';
import 'cuenta.dart';

class Solicitudes extends StatefulWidget {
  Solicitudes({Key? key}) : super(key: key);

  @override
  State<Solicitudes> createState() => _SolicitudesState();
}

class _SolicitudesState extends State<Solicitudes> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      body: Container(
        height: size.height,
        width: size.width,
        color: main.getIsDark
            ? const Color.fromRGBO(20, 20, 20, 1)
            : const Color.fromRGBO(240, 240, 240, 1),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.05),
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
                      "Solicitudes",
                      style: TextStyle(
                        color: main.getIsDark ? Colors.white : Colors.black54,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.019),
                SizedBox(
                  height: size.height - 102,
                  child: FutureBuilder(
                    future: api.solicitudes(main.getToken),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          itemCount: snapshot.data.length,
                          separatorBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              height: 5,
                              thickness: 2,
                              color: main.getIsDark
                                  ? Colors.white.withOpacity(0.1)
                                  : Colors.black.withOpacity(0.1),
                            ),
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
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
                              child: Row(
                                children: [
                                  Container(
                                    height: size.height * 0.1,
                                    width: 6,
                                    decoration: BoxDecoration(
                                      color: main.getIsDark
                                          ? Colors.green.withOpacity(0.5)
                                          : Colors.green.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 3.0,
                                          color: main.getIsDark
                                              ? const Color.fromRGBO(
                                                  30, 30, 30, 1)
                                              : Colors.black12,
                                          offset: const Offset(0.0, 0.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data[index]['nombre']
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: main.getIsDark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: (snapshot.data[index]
                                                      ['nombre'] !=
                                                  null)
                                              ? (snapshot.data[index]['nombre']
                                                          .length >
                                                      33)
                                                  ? 15
                                                  : 20
                                              : 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data[index]['codigo'],
                                        style: TextStyle(
                                          color: main.getIsDark
                                              ? Colors.white38
                                              : Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Estado: " +
                                                snapshot.data[index]['estado'],
                                            style: TextStyle(
                                              color: main.getIsDark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
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
                SizedBox(height: size.height * 0.019),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Data {
  Data(this.year, this.monto);

  final String year;
  final double monto;
}
