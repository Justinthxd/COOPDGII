import 'package:final_app/pages/map.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/acerca_de.dart';
import '../pages/cuenta.dart';
import '../pages/descuentos.dart';
import '../pages/noticias.dart';
import '../pages/prestamos.dart';
import '../pages/solicitudes.dart';
import '../provider/provider.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key}) : super(key: key);

  List<String> names = [
    'Cuentas',
    'Prestamos',
    'Solicitudes',
    'Noticias',
    'Descuentos',
    'Mapa',
    'Acerca de',
    'Configuracion',
  ];

  List<IconData> icons = [
    Icons.account_balance_wallet_rounded,
    Icons.attach_money_rounded,
    Icons.work_rounded,
    Icons.newspaper_rounded,
    Icons.discount_rounded,
    Icons.location_on_rounded,
    Icons.info_outline_rounded,
    Icons.settings_rounded,
  ];

  getRoute(String routeName) {
    print("Hola");
    switch (routeName) {
      case 'Cuentas':
        return Cuenta();
      case 'Prestamos':
        return Prestamos();
      case 'Solicitudes':
        return Solicitudes();
      case 'Noticias':
        return Noticias();
      case 'Descuentos':
        return Descuentos();
      case 'Mapa':
        return Map();
      case 'Acerca de':
        return AcercaDe();
    }
  }

  @override
  Widget build(BuildContext context) {
    final main = Provider.of<MainProvider>(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 130,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    height: 105,
                    width: 105,
                    decoration: BoxDecoration(
                      color: main.getIsDark
                          ? Colors.lightGreenAccent.withOpacity(0.09)
                          : Colors.blueGrey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 80,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: main.getIsDark
                          ? Colors.lightGreenAccent.withOpacity(0.09)
                          : Colors.blueGrey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: 10,
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: main.getIsDark
                          ? Colors.lightGreenAccent.withOpacity(0.03)
                          : Colors.blueGrey.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                main.getIsLogged
                    ? Positioned(
                        bottom: 10,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              main.getName,
                              style: TextStyle(
                                color: main.getIsDark
                                    ? Colors.white70
                                    : Colors.black54,
                                fontSize: 42,
                              ),
                            ),
                            Text(
                              main.getEmail,
                              style: TextStyle(
                                color: main.getIsDark
                                    ? Colors.white38
                                    : Colors.black38,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Positioned(
                        bottom: 10,
                        right: 20,
                        child: Text(
                          "COOPDGII",
                          style: TextStyle(
                            color: main.getIsDark
                                ? Colors.white70
                                : Colors.green.withOpacity(0.8),
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(
              thickness: 2,
            ),
          ),
          for (int i = 0; i < 3; i++)
            ListTile(
              title: Text(
                names[i],
                style: TextStyle(
                  color: main.getIsDark ? Colors.white : Colors.black87,
                  fontSize: 20,
                ),
              ),
              leading: Icon(
                icons[i],
                size: 30,
                color: main.getIsDark
                    ? Colors.lightGreenAccent.withOpacity(0.7)
                    : Color.fromARGB(255, 18, 177, 24),
              ),
              onTap: () {
                if (main.getIsLogged) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          getRoute(names[i]),
                      transitionDuration: const Duration(milliseconds: 500),
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
                }
              },
            ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(
              thickness: 2,
            ),
          ),
          for (int i = 0; i < 2; i++)
            ListTile(
              title: Text(
                names[i + 3],
                style: TextStyle(
                  color: main.getIsDark ? Colors.white : Colors.black87,
                  fontSize: 20,
                ),
              ),
              leading: Icon(
                icons[i + 3],
                size: 30,
                color: main.getIsDark
                    ? Colors.lightGreenAccent.withOpacity(0.7)
                    : Color.fromARGB(255, 18, 177, 24),
              ),
              onTap: () {
                if (main.getIsLogged) {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          getRoute(names[i + 3]),
                      transitionDuration: const Duration(milliseconds: 500),
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
                }
              },
            ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(
              thickness: 2,
            ),
          ),
          for (int i = 0; i < 2; i++)
            ListTile(
              title: Text(
                names[i + 5],
                style: TextStyle(
                  color: main.getIsDark ? Colors.white : Colors.black87,
                  fontSize: 20,
                ),
              ),
              leading: Icon(
                icons[i + 5],
                size: 30,
                color: main.getIsDark
                    ? Colors.lightGreenAccent.withOpacity(0.7)
                    : Color.fromARGB(255, 18, 177, 24),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        getRoute(names[i + 5]),
                    transitionDuration: const Duration(milliseconds: 500),
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
            ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider(
              thickness: 2,
            ),
          ),
          // theme
          ListTile(
            title: Text(
              'Tema',
              style: TextStyle(
                color: main.getIsDark ? Colors.white : Colors.black87,
                fontSize: 20,
              ),
            ),
            leading: Icon(
              main.getIsDark
                  ? Icons.brightness_high_sharp
                  : Icons.brightness_low_sharp,
              size: 30,
              color: main.getIsDark
                  ? Colors.lightGreenAccent.withOpacity(0.7)
                  : Color.fromARGB(255, 18, 177, 24),
            ),
            onTap: () {
              main.setIsDark = !main.getIsDark;
            },
          ),
          ListTile(
            title: Text(
              names[7],
              style: TextStyle(
                color: main.getIsDark ? Colors.white : Colors.black87,
                fontSize: 20,
              ),
            ),
            leading: Icon(
              icons[7],
              size: 30,
              color: main.getIsDark
                  ? Colors.lightGreenAccent.withOpacity(0.7)
                  : Color.fromARGB(255, 18, 177, 24),
            ),
            onTap: () {},
          ),
          Spacer(),
          main.getIsLogged
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Divider(
                    thickness: 2,
                  ),
                )
              : SizedBox(),
          main.getIsLogged
              ? ListTile(
                  title: Text(
                    'Cerrar sesión',
                    style: TextStyle(
                      color: main.getIsDark ? Colors.white : Colors.black87,
                      fontSize: 20,
                    ),
                  ),
                  leading: Icon(
                    Icons.logout_rounded,
                    size: 30,
                    color: main.getIsDark
                        ? Colors.green.withOpacity(0.9)
                        : Color.fromARGB(255, 18, 177, 24),
                  ),
                  onTap: () {
                    main.setIsLogged = false;
                    Navigator.of(context)
                      ..pop()
                      ..pop();
                  },
                )
              : SizedBox(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class Mapa {}
