import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/api.dart';
import '../provider/provider.dart';
import '../resource/drawer.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  API api = API();

  List<IconData> icons = [
    Icons.account_balance_wallet_rounded,
    Icons.attach_money_rounded,
    Icons.trending_up_rounded,
    Icons.newspaper_rounded,
    Icons.discount_rounded,
    Icons.info_outline_rounded,
  ];

  List<String> names = [
    'Cuentas',
    'Prestamos',
    'Inversiones',
    'Noticias',
    'Descuentos',
    'Acerca de',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final main = Provider.of<MainProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(main: main),
      body: Container(
        height: size.height,
        width: size.width,
        color: main.getIsDark
            ? const Color.fromRGBO(20, 20, 20, 1)
            : const Color.fromRGBO(225, 225, 225, 1),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: size.height * 0.08),
                Container(
                  height: 150,
                  width: size.width,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: main.getIsDark
                        ? Colors.green[900]
                        : Colors.green.withOpacity(0.99),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Colors.black26,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Justin Inoa",
                            // main.getUserName,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "06/09/2020",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.white12,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Ahorros",
                            // main.getUserName,
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Descuento",
                            // main.getUserName,
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$27,300.00",
                            // main.getUserName,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "\$1,700.00",
                            // main.getUserName,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    children: [
                      for (var i = 0; i < 6; i++)
                        GestureDetector(
                          onTap: () {
                            api.resumen(main.getToken).then((value) {
                              if (value['success']) {
                                Navigator.pushNamed(context, '/${names[i]}');
                              }
                            });
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: main.getIsDark
                                  ? const Color.fromRGBO(20, 20, 20, 1)
                                  : const Color.fromRGBO(225, 225, 225, 1),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5.0,
                                  color: main.getIsDark
                                      ? const Color.fromRGBO(30, 30, 30, 1)
                                      : const Color.fromRGBO(235, 235, 235, 1),
                                  offset: const Offset(-3.0, -3.0),
                                ),
                                BoxShadow(
                                  blurRadius: 5.0,
                                  color: main.getIsDark
                                      ? const Color.fromRGBO(10, 10, 10, 1)
                                      : const Color.fromRGBO(210, 210, 210, 1),
                                  offset: const Offset(3.0, 3.0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  icons[i],
                                  size: 60,
                                  color: Colors.green,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  names[i],
                                  style: TextStyle(
                                    color: main.getIsDark
                                        ? Colors.white
                                        : Colors.black54,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
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
                    "Dashboard",
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
