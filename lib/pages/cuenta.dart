import 'package:final_app/resource/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../data/api.dart';
import '../provider/provider.dart';

class Cuenta extends StatefulWidget {
  Cuenta({Key? key}) : super(key: key);

  @override
  State<Cuenta> createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _pageController = PageController(initialPage: 0);

  API api = API();

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

  List<String> amountsI = [
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

  List<String> datesI = [
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

  List<String> descriptionsI = [
    "Tesla",
    "Apple",
    "Google",
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
    "Pago de servicios",
    "Transferencia a Maria",
    "Pago Automovil",
    "Pago parcial 2022",
    "Pago de servicios",
    "Monto olvidado",
    "Pago de servicios",
    "Transferencia Pedro",
    "Pago de servicios",
    "Pago de servicios",
    "Rica",
    "Pago de servicios",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final main = Provider.of<MainProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: main.getIsDark
                ? const Color.fromRGBO(20, 20, 20, 1)
                : const Color.fromRGBO(235, 235, 235, 1),
            child: PageView(
              controller: _pageController,
              children: [
                Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: size.width * 0.05),
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color:
                                main.getIsDark ? Colors.white : Colors.black54,
                            size: 30,
                          ),
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Cuentas",
                          style: TextStyle(
                            color:
                                main.getIsDark ? Colors.white : Colors.black54,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 430,
                      child: FutureBuilder(
                        future: api.resumen(main.getToken),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  snapshot.data['data']['cuentas'].length,
                              separatorBuilder: (context, index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(
                                  height: 5,
                                  thickness: 2,
                                  color: main.getIsDark
                                      ? Colors.white.withOpacity(0.1)
                                      : Colors.black.withOpacity(0.1),
                                ),
                              ),
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 205,
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: main.getIsDark
                                          ? Color.fromARGB(255, 33, 32, 54)
                                          : const Color.fromARGB(
                                                  255, 28, 120, 196)
                                              .withOpacity(0.9),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 5.0,
                                          color: main.getIsDark
                                              ? const Color.fromRGBO(
                                                  30, 30, 30, 1)
                                              : const Color.fromRGBO(
                                                  235, 235, 235, 1),
                                          offset: const Offset(-3.0, -3.0),
                                        ),
                                        BoxShadow(
                                          blurRadius: 5.0,
                                          color: main.getIsDark
                                              ? const Color.fromRGBO(
                                                  10, 10, 10, 1)
                                              : const Color.fromRGBO(
                                                  210, 210, 210, 1),
                                          offset: const Offset(3.0, 3.0),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          top: 25,
                                          child: Transform.rotate(
                                            angle: 1,
                                            child: Container(
                                              height: 100,
                                              width: 160,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: main.getIsDark
                                                    ? Color.fromARGB(
                                                        255, 36, 35, 59)
                                                    : Colors.white10,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Balance",
                                                  style: TextStyle(
                                                    color: main.getIsDark
                                                        ? Colors.white60
                                                        : Colors.white70,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  "Banreservas",
                                                  style: TextStyle(
                                                    color: main.getIsDark
                                                        ? Colors.white60
                                                        : Colors.white70,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\$" +
                                                      snapshot.data['data']
                                                              ['cuentas'][index]
                                                              [
                                                              'balance_disponible']
                                                          .toString(),
                                                  style: TextStyle(
                                                    color: main.getIsDark
                                                        ? Colors.white
                                                            .withOpacity(0.9)
                                                        : Colors.white,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  snapshot.data['data']
                                                          ['cuentas'][index]
                                                          ['idcuenta']
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: main.getIsDark
                                                        ? Colors.white
                                                            .withOpacity(0.25)
                                                        : Colors.white70,
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "06/22",
                                                  style: TextStyle(
                                                    color: main.getIsDark
                                                        ? Colors.white
                                                            .withOpacity(0.25)
                                                        : Colors.white70,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Image.asset(
                                                  "assets/images/card.png",
                                                  height: 35,
                                                  width: 35,
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
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_rounded,
                          size: 50,
                          color:
                              main.getIsDark ? Colors.white24 : Colors.black26,
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 0,
                        color: main.getIsDark
                            ? Colors.white.withOpacity(0.1)
                            : Colors.black.withOpacity(0.1),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        _pageController.animateToPage(
                          1,
                          duration: Duration(seconds: 1),
                          curve: Curves.linearToEaseOut,
                        );
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: main.getIsDark ? Colors.white : Colors.black87,
                      ),
                      title: Text(
                        "Transacciones",
                        style: TextStyle(
                          color: main.getIsDark ? Colors.white : Colors.black87,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 0,
                        color: main.getIsDark
                            ? Colors.white.withOpacity(0.1)
                            : Colors.black.withOpacity(0.1),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        _pageController.animateToPage(
                          2,
                          duration: Duration(seconds: 1),
                          curve: Curves.linearToEaseOut,
                        );
                      },
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                        color: main.getIsDark ? Colors.white : Colors.black87,
                      ),
                      title: Text(
                        "Inversiones",
                        style: TextStyle(
                          color: main.getIsDark ? Colors.white : Colors.black87,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: size.width * 0.05),
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color:
                                main.getIsDark ? Colors.white : Colors.black54,
                            size: 30,
                          ),
                          onPressed: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Transacciones",
                          style: TextStyle(
                            color:
                                main.getIsDark ? Colors.white : Colors.black54,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.019),
                    Expanded(
                      child: FutureBuilder(
                        future: api.resumen(main.getToken),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              itemCount: 7,
                              separatorBuilder: (context, index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Divider(
                                  height: 5,
                                  thickness: 2,
                                  color: main.getIsDark
                                      ? Colors.white.withOpacity(0.1)
                                      : Colors.black.withOpacity(0.1),
                                ),
                              ),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Row(
                                    children: [
                                      Container(
                                        height: size.height * 0.015,
                                        width: 7,
                                        decoration: BoxDecoration(
                                          color: (int.parse(amounts[index]) <
                                                  10000)
                                              ? Colors.red
                                              : Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                      Text(
                                        descriptions[index],
                                        style: TextStyle(
                                          color: main.getIsDark
                                              ? Colors.white.withOpacity(0.8)
                                              : Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "\$" + amounts[index],
                                        style: TextStyle(
                                          color: (int.parse(amounts[index]) <
                                                  10000)
                                              ? Colors.red
                                              : Colors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    "12/12/2020",
                                    style: TextStyle(
                                      color: main.getIsDark
                                          ? Colors.white.withOpacity(0.5)
                                          : Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  trailing: Text(
                                    "",
                                    style: TextStyle(
                                      color: main.getIsDark
                                          ? Colors.white.withOpacity(0.5)
                                          : Colors.black,
                                      fontSize: 20,
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
                Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: size.width * 0.05),
                        IconButton(
                          icon: Icon(
                            Icons.menu,
                            color:
                                main.getIsDark ? Colors.white : Colors.black54,
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
                            color:
                                main.getIsDark ? Colors.white : Colors.black54,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.019),
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
                            : Color.fromARGB(255, 41, 38, 71),
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
                          "Inversiones",
                          style: TextStyle(
                            color: main.getIsDark
                                ? Colors.white.withOpacity(0.8)
                                : Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                              height: 5,
                              thickness: 2,
                              color: main.getIsDark
                                  ? Colors.white.withOpacity(0.1)
                                  : Colors.black.withOpacity(0.1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.019),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            height: 5,
                            thickness: 2,
                            color: main.getIsDark
                                ? Colors.white.withOpacity(0.1)
                                : Colors.black.withOpacity(0.1),
                          ),
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: descriptionsI.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  descriptionsI[i],
                                  style: TextStyle(
                                    color: (descriptionsI[i] == "Tesla")
                                        ? Colors.red
                                        : (descriptionsI[i] == "Apple")
                                            ? Colors.green
                                            : Colors.blueAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "^+1." + (3 * i).toString() + "%",
                                  style: TextStyle(
                                    color: main.getIsDark
                                        ? Colors.green
                                        : Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "\$" + amountsI[i],
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
                                        ? Colors.white.withOpacity(0.5)
                                        : Colors.black54,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  dates[i],
                                  style: TextStyle(
                                    color: main.getIsDark
                                        ? Colors.white.withOpacity(0.5)
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Data {
  Data(this.year, this.monto);

  final String year;
  final double monto;
}
