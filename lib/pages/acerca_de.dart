import 'package:final_app/pages/map.dart';
import 'package:final_app/resource/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../data/api.dart';
import '../provider/provider.dart';

class AcercaDe extends StatefulWidget {
  AcercaDe({Key? key}) : super(key: key);

  @override
  State<AcercaDe> createState() => _AcercaDeState();
}

class _AcercaDeState extends State<AcercaDe> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _pageController = PageController(initialPage: 0);

  static const _initialCamaraPosition = CameraPosition(
    target: LatLng(18.4741397, -69.9050573),
    zoom: 17.5,
  );

  late GoogleMapController _googleMapController;

  API api = API();

  Set<Marker> markers = {
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(
        18.4741397,
        -69.9050573,
      ),
    ),
  };

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  List<String> images = [
    'https://coopdgii.com/wp-content/uploads/2021/10/Suelin.jpg',
    'https://coopdgii.com/wp-content/uploads/2021/10/Maria-Es.jpg',
    'https://coopdgii.com/wp-content/uploads/2021/10/MicrosoftTeams-image-4.jpg',
    'https://coopdgii.com/wp-content/uploads/2021/10/MicrosoftTeams-image-6.jpg',
    'https://coopdgii.com/wp-content/uploads/2021/10/MicrosoftTeams-image-3.jpg',
  ];

  List<String> names = [
    'Suelin Pimentel',
    'Maria Escolastico',
    'Yohanny Duarte',
    'Anny Rodriguez',
    'Yulitza Nuñez',
  ];
  List<String> emails = [
    'supimentel@dgii.gov.do',
    'mescolastico@dgii.gov.do',
    'yduarte@dgii.gov.do',
    'annrodrigu@dgii.gov.do',
    'ymnunezb@dgii.gov.do',
  ];
  List<String> position = [
    'Encargada de Area de Servicio',
    'Oficial de Servicio',
    'Oficial de Servicio',
    'Oficial de Servicio',
    'Cajera Oficial de Servicios',
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    final size = MediaQuery.of(context).size;
    final main = Provider.of<MainProvider>(context);
    return Scaffold(
      backgroundColor: main.getIsDark
          ? const Color.fromRGBO(20, 20, 20, 1)
          : const Color.fromRGBO(245, 245, 245, 1),
      key: _scaffoldKey,
      drawer: MainDrawer(),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            margin: const EdgeInsets.only(top: 80),
            color: main.getIsDark
                ? const Color.fromRGBO(20, 20, 20, 1)
                : const Color.fromRGBO(245, 245, 245, 1),
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                setState(() {});
              },
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    width: size.width - 40,
                    child: Row(
                      children: [
                        Text(
                          'Contactos',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: main.getIsDark
                                ? const Color.fromRGBO(255, 255, 255, 1)
                                : Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: size.width - 250,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            thickness: 2,
                            color: main.getIsDark
                                ? Colors.white.withOpacity(0.1)
                                : Colors.black.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (int i = 0; i < 5; i++)
                    Container(
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
                                : const Color.fromRGBO(250, 250, 250, 1),
                            offset: const Offset(-3.0, -3.0),
                          ),
                          BoxShadow(
                            blurRadius: 5.0,
                            color: main.getIsDark
                                ? const Color.fromRGBO(10, 10, 10, 1)
                                : const Color.fromRGBO(235, 235, 235, 1),
                            offset: const Offset(3.0, 3.0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: FadeInImage(
                              image: NetworkImage(
                                images[i],
                              ),
                              fit: BoxFit.fitHeight,
                              placeholder: const AssetImage(
                                'assets/images/placeholder.jpg',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                names[i],
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                position[i],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: main.getIsDark
                                      ? Colors.white60
                                      : Colors.black.withOpacity(0.6),
                                ),
                              ),
                              Text(
                                emails[i],
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Text(
                          'Llámenos',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: main.getIsDark
                                ? const Color.fromRGBO(255, 255, 255, 1)
                                : Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: size.width - 230,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            thickness: 2,
                            color: main.getIsDark
                                ? Colors.white.withOpacity(0.1)
                                : Colors.black.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      launchUrlString('tel://8092872095');
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
                                : const Color.fromRGBO(250, 250, 250, 1),
                            offset: const Offset(-3.0, -3.0),
                          ),
                          BoxShadow(
                            blurRadius: 5.0,
                            color: main.getIsDark
                                ? const Color.fromRGBO(10, 10, 10, 1)
                                : const Color.fromRGBO(235, 235, 235, 1),
                            offset: const Offset(3.0, 3.0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 30),
                          IconButton(
                            color: Colors.green,
                            icon: const Icon(
                              Icons.call_rounded,
                              size: 30,
                              color: Colors.green,
                            ),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 20),
                          // number
                          Text(
                            '+1 809-287-2095',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: main.getIsDark
                                  ? Colors.green
                                  : const Color.fromARGB(255, 27, 88, 29),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      thickness: 2,
                      color: main.getIsDark
                          ? Colors.white.withOpacity(0.1)
                          : Colors.black.withOpacity(0.1),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    width: 400,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: main.getIsDark
                          ? const Color.fromRGBO(20, 20, 20, 1)
                          : const Color.fromRGBO(245, 245, 245, 1),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: main.getIsDark ? Colors.black : Colors.black26,
                          offset: const Offset(0.0, 3.0),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 350,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: GoogleMap(
                            myLocationButtonEnabled: false,
                            zoomControlsEnabled: false,
                            mapType: MapType.hybrid,
                            initialCameraPosition: _initialCamaraPosition,
                            onMapCreated: (controller) =>
                                _googleMapController = controller,
                            onTap: (value) {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const Map(),
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
                            markers: markers,
                          ),
                        ),
                        const Text(
                          "Av. Pedro Henríquez Ureña 29,\nSanto Domingo",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                  "Acerca de",
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
