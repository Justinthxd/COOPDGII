import 'package:final_app/resource/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../provider/provider.dart';
import 'cuenta.dart';

class Inversiones extends StatefulWidget {
  Inversiones({Key? key}) : super(key: key);

  @override
  State<Inversiones> createState() => _InversionesState();
}

class _InversionesState extends State<Inversiones> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Data> tesla = [
    Data("Enero", 100),
    Data("Febrero", 200),
    Data("Marzo", 300),
    Data("Abril", 400),
    Data("Mayo", 400),
    Data("Junio", 600),
    Data("Julio", 700),
    Data("Agosto", 600),
    Data("Septiembre", 900),
    Data("Octubre", 1000),
    Data("Noviembre", 1100),
    Data("Diciembre", 1200),
  ];

  List<Data> apple = [
    Data("Enero", 200),
    Data("Febrero", 300),
    Data("Marzo", 400),
    Data("Abril", 700),
    Data("Mayo", 600),
    Data("Junio", 700),
    Data("Julio", 900),
    Data("Agosto", 900),
    Data("Septiembre", 1000),
    Data("Octubre", 1100),
    Data("Noviembre", 1200),
    Data("Diciembre", 1300),
  ];

  List<Data> google = [
    Data("Enero", 300),
    Data("Febrero", 400),
    Data("Marzo", 500),
    Data("Abril", 600),
    Data("Mayo", 700),
    Data("Junio", 600),
    Data("Julio", 500),
    Data("Agosto", 600),
    Data("Septiembre", 1100),
    Data("Octubre", 700),
    Data("Noviembre", 700),
    Data("Diciembre", 800),
  ];

  List<String> amounts = [
    "23040",
    "12040",
    "473",
    "40322",
    "12321",
    "9325",
    "1002",
    "42114",
    "12321",
    "12040",
    "1002",
    "63890",
  ];

  List<String> dates = [
    "12/01/2020",
    "12/02/2020",
    "12/03/2020",
    "12/04/2020",
    "12/05/2020",
    "12/06/2020",
    "12/07/2020",
    "12/08/2020",
    "12/09/2020",
    "12/10/2020",
    "12/11/2020",
    "12/12/2020",
  ];

  List<String> descriptions = [
    "Tesla",
    "Apple",
    "Google",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final main = Provider.of<MainProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
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
                SizedBox(height: size.height * 0.08),
                Container(
                  height: 300,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: main.getIsDark
                        ? const Color.fromRGBO(20, 20, 20, 1)
                        : const Color.fromRGBO(240, 240, 240, 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: main.getIsDark
                            ? const Color.fromRGBO(30, 30, 30, 1)
                            : const Color.fromRGBO(250, 250, 250, 1),
                        offset: const Offset(-3.0, -3.0),
                      ),
                      BoxShadow(
                        blurRadius: 5.0,
                        color: main.getIsDark
                            ? const Color.fromRGBO(10, 10, 10, 1)
                            : const Color.fromRGBO(230, 230, 230, 1),
                        offset: const Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    plotAreaBackgroundColor: main.getIsDark
                        ? const Color.fromRGBO(20, 20, 20, 1)
                        : const Color.fromARGB(255, 41, 38, 71),
                    series: [
                      LineSeries(
                        animationDuration: 5000,
                        name: 'Tesla',
                        dataSource: tesla,
                        color: Colors.red,
                        xValueMapper: (Data sales, _) => sales.year,
                        yValueMapper: (Data sales, _) => sales.monto,
                      ),
                      LineSeries(
                        animationDuration: 4000,
                        name: 'Apple',
                        dataSource: apple,
                        color: Colors.green,
                        xValueMapper: (Data sales, _) => sales.year,
                        yValueMapper: (Data sales, _) => sales.monto,
                      ),
                      LineSeries(
                        animationDuration: 3000,
                        name: 'Google',
                        dataSource: google,
                        color: Colors.blueAccent,
                        xValueMapper: (Data sales, _) => sales.year,
                        yValueMapper: (Data sales, _) => sales.monto,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.019),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.05),
                    Text(
                      "Investments",
                      style: TextStyle(
                        color: main.getIsDark
                            ? Colors.white.withOpacity(0.8)
                            : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: const Divider(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.019),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: main.getIsDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.1),
                    ),
                    physics: const BouncingScrollPhysics(),
                    itemCount: descriptions.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              descriptions[i],
                              style: TextStyle(
                                color: (descriptions[i] == "Tesla")
                                    ? Colors.red
                                    : (descriptions[i] == "Apple")
                                        ? Colors.green
                                        : Colors.blueAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "\$" + amounts[i],
                              style: TextStyle(
                                color: main.getIsDark
                                    ? Colors.white.withOpacity(0.9)
                                    : Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text(
                              "Investments NY",
                              style: TextStyle(
                                color: main.getIsDark
                                    ? Colors.white.withOpacity(0.2)
                                    : Colors.black54,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              dates[i],
                              style: TextStyle(
                                color: main.getIsDark
                                    ? Colors.white.withOpacity(0.3)
                                    : Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
            // - - - - - - - //
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
                    "Inversiones",
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
      ),
    );
  }
}

class Data {
  Data(this.year, this.monto);

  final String year;
  final double monto;
}
