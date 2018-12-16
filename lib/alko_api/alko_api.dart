import 'package:alkomaholi/alko_api/alko_response.dart';
import 'package:http/http.dart' as http;

class AlkoApi {
  String queryUrl(String query) => "http://alkomaho.li/api/data?query=$query";

  Future<List<Product>> getProducts(String query) async {
    assert(query != null || query != '');
    final response = await http.read(queryUrl(query));
    final products = productFromJson(response);
    return products;
  }
}
