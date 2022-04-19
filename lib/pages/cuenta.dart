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

  API api = API();

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
      drawer: MainDrawer(main: main),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: main.getIsDark
                ? const Color.fromRGBO(20, 20, 20, 1)
                : const Color.fromRGBO(225, 225, 225, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.08),
                Flexible(
                  flex: 3,
                  child: FutureBuilder(
                    future: api.resumen(main.getToken),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          itemCount: snapshot.data['data']['cuentas'].length,
                          separatorBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              height: 0,
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
                                      ? const Color.fromRGBO(20, 20, 20, 1)
                                      : const Color.fromARGB(255, 28, 120, 196)
                                          .withOpacity(0.9),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: main.getIsDark
                                          ? const Color.fromRGBO(30, 30, 30, 1)
                                          : const Color.fromRGBO(
                                              235, 235, 235, 1),
                                      offset: const Offset(-3.0, -3.0),
                                    ),
                                    BoxShadow(
                                      blurRadius: 5.0,
                                      color: main.getIsDark
                                          ? const Color.fromRGBO(10, 10, 10, 1)
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
                                                ? Colors.white
                                                    .withOpacity(0.0099)
                                                : Colors.white10,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$" +
                                                  snapshot.data['data']
                                                          ['cuentas'][index]
                                                          ['balance_disponible']
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
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapshot.data['data']['cuentas']
                                                      [index]['idcuenta']
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
                                              MainAxisAlignment.spaceBetween,
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
                Row(
                  children: [
                    SizedBox(width: size.width * 0.05),
                    Text(
                      "Transactions",
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
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.019),
                Flexible(
                  flex: 2,
                  child: FutureBuilder(
                    future: api.resumen(main.getToken),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Row(
                                children: [
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
                                      color: (int.parse(amounts[index]) < 10000)
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
                  "Cuentas",
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
