import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

void a() async {
  var json = await http.get(
    Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/USD'),
    headers: {
      HttpHeaders.authorizationHeader: '20824201-AF8B-4FCE-9AB9-348F0E205BA5',
    },
  );
  print(json.statusCode);
  // if (json.statusCode == 200) {
  //   var decodedData = jsonDecode(json.body);
  //   print(decodedData);
  // }
}

main() {
  a();
}
