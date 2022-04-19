import 'dart:convert';

import 'package:http/http.dart' as http;

String url = 'https://coopdgii.com/coopvirtual/App/';

class API {
  Future login(String user, String password) async {
    final response = await http.post(
      Uri.parse(url + 'login'),
      body: {'usuario': user, 'clave': password},
    );

    final data = json.decode(response.body);

    return data;
  }

  Future resumen(String token) async {
    final response = await http.post(
      Uri.parse(url + 'resumen'),
      body: {'token': token},
    );

    final data = json.decode(response.body);

    return data;
  }

  Future prestamos(String token) async {
    final response = await http.post(
      Uri.parse(url + 'resumen'),
      body: {'token': token},
    );

    final data = json.decode(response.body);

    return data['data']['prestamos'];
  }

  Future descuentos(String token) async {
    final response = await http.post(
      Uri.parse(url + 'descuentos'),
      body: {'token': token},
    );

    final data = json.decode(response.body);

    print(data);

    return data['data'];
  }
}
