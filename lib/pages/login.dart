import 'package:final_app/pages/home.dart';
import 'package:final_app/provider/provider.dart';
import 'package:final_app/resource/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/api.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  API api = API();

  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final main = Provider.of<MainProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(main: main),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: main.getIsDark
                  ? Color.fromRGBO(20, 20, 20, 1)
                  : Color.fromRGBO(245, 245, 245, 1),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.1),
                    Container(
                      height: size.height * 0.3,
                      width: size.width * 0.8,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: main.getIsDark
                            ? Color.fromRGBO(20, 20, 20, 1)
                            : const Color.fromRGBO(245, 245, 245, 1),
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: main.getIsDark
                                ? Color.fromRGBO(30, 30, 30, 1)
                                : Color.fromRGBO(255, 255, 255, 1),
                            offset: Offset(-3.0, -3.0),
                          ),
                          BoxShadow(
                            blurRadius: 5.0,
                            color: main.getIsDark
                                ? Color.fromRGBO(10, 10, 10, 1)
                                : Color.fromRGBO(235, 235, 235, 1),
                            offset: Offset(3.0, 3.0),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextField(
                        controller: _userController,
                        textCapitalization: TextCapitalization.sentences,
                        style: const TextStyle(
                          fontSize: 19,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_rounded,
                            color:
                                main.getIsDark ? Colors.white : Colors.black54,
                          ),
                          hintText: 'Matricula',
                          hintStyle: TextStyle(
                            fontSize: 19,
                            color:
                                main.getIsDark ? Colors.white : Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: main.getIsDark
                            ? Color.fromRGBO(20, 20, 20, 1)
                            : Color.fromRGBO(245, 245, 245, 1),
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: main.getIsDark
                                ? Color.fromRGBO(30, 30, 30, 1)
                                : Color.fromRGBO(255, 255, 255, 1),
                            offset: Offset(-3.0, -3.0),
                          ),
                          BoxShadow(
                            blurRadius: 5.0,
                            color: main.getIsDark
                                ? Color.fromRGBO(10, 10, 10, 1)
                                : Color.fromRGBO(235, 235, 235, 1),
                            offset: Offset(3.0, 3.0),
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextField(
                        controller: _passwordController,
                        textCapitalization: TextCapitalization.sentences,
                        style: const TextStyle(
                          fontSize: 19,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color:
                                main.getIsDark ? Colors.white : Colors.black54,
                          ),
                          hintText: 'Passsword',
                          hintStyle: TextStyle(
                            fontSize: 19,
                            color:
                                main.getIsDark ? Colors.white : Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    const SizedBox(height: 45),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      height: 50,
                      width: size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: main.getIsDark
                              ? Colors.green.withOpacity(0.8)
                              : Colors.green,
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          api
                              .login(
                            _userController.text,
                            _passwordController.text,
                          )
                              .then((value) {
                            if (value['success']) {
                              api.descuentos(value['data']['token']);
                              main.setToken(value['data']['token']);
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                  pageBuilder: (context, a, b) => Home(),
                                  transitionsBuilder: (c, anim, a2, child) =>
                                      FadeTransition(
                                    opacity: anim,
                                    child: child,
                                  ),
                                ),
                              );
                            } else {
                              _userController.clear();
                              _passwordController.clear();
                            }
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.lightBlue.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      height: 50,
                      width: size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: main.getIsDark
                              ? Colors.blue.shade900
                              : Colors.blue.shade800,
                        ),
                        child: const Text(
                          "Sing Up",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 18,
              top: 18,
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                ),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
