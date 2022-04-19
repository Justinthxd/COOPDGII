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

  int index = -1;

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
                        final list = [
                          for (int i = 0; i < snapshot.data.length; i++) true,
                        ];
                        return SingleChildScrollView(
                          child: ExpansionPanelList(
                            expansionCallback: (panelIndex, isExpanded) {
                              setState(() {
                                if (index == panelIndex) {
                                  index = -1;
                                } else {
                                  index = panelIndex;
                                }
                              });
                            },
                            children: [
                              for (int i = 0; i < snapshot.data.length; i++)
                                ExpansionPanel(
                                  isExpanded: index == i,
                                  backgroundColor:
                                      Color.fromRGBO(245, 245, 245, 1),
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
                                    return Container(
                                      margin: const EdgeInsets.all(10),
                                      child: const ListTile(
                                        tileColor: Colors.transparent,
                                        title: Text(
                                          'Prestamos',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  body: Container(
                                    height: size.height * 0.1,
                                    child: Text(""),
                                  ),
                                ),
                            ],
                          ),
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
