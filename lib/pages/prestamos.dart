import 'package:final_app/resource/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../data/api.dart';
import '../provider/provider.dart';

class Prestamos extends StatefulWidget {
  Prestamos({Key? key}) : super(key: key);

  @override
  State<Prestamos> createState() => _PrestamosState();
}

class _PrestamosState extends State<Prestamos> {
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
                    future: api.prestamos(main.getToken),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data[1]);

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
                                    width: 5,
                                    decoration: BoxDecoration(
                                      color: main.getIsDark
                                          ? const Color.fromARGB(
                                              255, 156, 129, 39)
                                          : const Color.fromARGB(
                                              255, 238, 189, 30),
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
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            snapshot.data[index]['descripcion'],
                                            style: TextStyle(
                                              color: main.getIsDark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        snapshot.data[index]['fecha_prestamo'],
                                        style: TextStyle(
                                          color: main.getIsDark
                                              ? Colors.white38
                                              : Colors.black45,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Monto: \$" +
                                                snapshot.data[index]
                                                    ['monto_prestamo'],
                                            style: TextStyle(
                                              color: main.getIsDark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(width: size.width * 0.1),
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
                  "Prestamos",
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
