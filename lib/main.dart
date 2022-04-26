import 'package:final_app/pages/acerca_de.dart';
import 'package:final_app/pages/noticias.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'pages/cuenta.dart';
import 'pages/descuentos.dart';
import 'pages/home.dart';
import 'pages/investments.dart';
import 'pages/login.dart';
import 'pages/prestamos.dart';
import 'pages/solicitudes.dart';
import 'pages/sub_descuentos.dart';
import 'provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => MainProvider(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    final main = Provider.of<MainProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: main.getIsDark ? ThemeData.dark() : ThemeData.light(),
      title: 'Material App',
      initialRoute: '/login',
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/Cuentas': (context) => Cuenta(),
        '/Inversiones': (context) => Inversiones(),
        '/Prestamos': (context) => Prestamos(),
        '/Solicitudes': (context) => Solicitudes(),
        '/Noticias': (context) => Noticias(),
        '/Descuentos': (context) => Descuentos(),
        '/Acerca de': (context) => AcercaDe(),
      },
    );
  }
}
