import 'dart:convert';

import 'package:final_app/pages/noticias.dart';
import 'package:final_app/pages/solicitudes.dart';
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

  Future solicitudes(String token) async {
    final response = await http.post(
      Uri.parse(url + 'solicitudes'),
      body: {'token': token},
    );

    final data = json.decode(response.body);

    return data['data'];
  }

  Future solicitudesPost(String token) async {
    final _json = json.encode("[[nombre, -]]");
    final response = await http.post(
      Uri.parse(url + 'solicitudes_registro'),
      body: {'token': token, 'tipo': '1', 'datos': _json},
    );

    final data = json.decode(response.body);

    print(data);

    return data['data'];
  }

  Future solicitudesTipos(String token) async {
    final response = await http.post(
      Uri.parse(url + 'solicitudes_tipo'),
      body: {'token': token},
    );

    final data = json.decode(response.body);

    return data['data'];
  }

  Future noticias(String token) async {
    final response = await http.post(
      Uri.parse(url + 'noticias'),
      body: {'token': token},
    );

    final data = json.decode(response.body);

    return data['data'];
  }

  Future descuentos(String token) async {
    final response = await http.post(
      Uri.parse(url + 'descuentos'),
      body: {'token': token},
    );

    final data = json.decode(response.body);

    return data['data'];
  }
}
