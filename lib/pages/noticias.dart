import 'package:final_app/resource/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../data/api.dart';
import '../provider/provider.dart';

class Noticias extends StatefulWidget {
  Noticias({Key? key}) : super(key: key);

  @override
  State<Noticias> createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
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
                    future: api.noticias(main.getToken),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          itemCount: snapshot.data.length,
                          separatorBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              height: 20,
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
                                            255, 255, 255, 1),
                                    offset: const Offset(-3.0, -3.0),
                                  ),
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    color: main.getIsDark
                                        ? const Color.fromRGBO(10, 10, 10, 1)
                                        : const Color.fromRGBO(
                                            230, 230, 230, 1),
                                    offset: const Offset(3.0, 3.0),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    width: double.infinity,
                                    child: FadeInImage(
                                      image: NetworkImage(
                                        snapshot.data[index]['imagen'],
                                      ),
                                      fit: BoxFit.fill,
                                      placeholder: const AssetImage(
                                        'assets/images/placeholder.png',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    snapshot.data[index]['title'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: main.getIsDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    snapshot.data[index]['content'].trim(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: main.getIsDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    snapshot.data[index]['date'],
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: main.getIsDark
                                          ? Colors.white
                                          : Colors.black26,
                                    ),
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
                  "Noticias",
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
