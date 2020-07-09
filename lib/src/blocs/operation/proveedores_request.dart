import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:utilidades/src/models/provedores_model.dart';
import 'package:utilidades/src/resources/data_final.dart';

Future<List<ProvedoresModel>> getProveedores() async {
  String url = urlApi + '/proveedores';

  final response = await http.get(url, headers: {
    'Accept': 'application/json',
    'Content-Type': 'application/json; charset=utf-8'
  });



  if (response.statusCode == 200) {
    print('Si Dio 200');
    List<dynamic> responseJson = json.decode(utf8.decode(response.bodyBytes));
    List<ProvedoresModel> p = [];

    for(var i = 0; i<responseJson.length; i++){
      p.add(responseJson[i]);
    }

    return p;

  } else {
    print(response.statusCode);
  }
}
