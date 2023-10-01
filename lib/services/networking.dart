import 'dart:io';

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String uriBase = 'rest.coinapi.io';
  Future<String> getExchangeRate(
      String baseCurrencyCode, String targetCurrencyCode) async {
    var json = await http.get(
      Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$baseCurrencyCode/$targetCurrencyCode'),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: '20824201-AF8B-4FCE-9AB9-348F0E205BA5',
      },
    );
    if (json.statusCode == 200) {
      var decodedData = jsonDecode(json.body);
      print(decodedData);
      int rate = decodedData['rate'].toInt();
      return rate.toString();
    }
    return '0';
  }
}
