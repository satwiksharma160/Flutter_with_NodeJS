import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class Api {
  static const baseUrl = "http://172.16.52.224/api/";

  static addproduct(Map pdata) async {
    print(pdata);
    var url = Uri.parse(baseUrl + "add_product");

    try {
      final res = await http.post(url, body: pdata);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Error");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//get method

  static getproduct() async {
    List<Product> products = [];

    var url = Uri.parse(baseUrl + "get_product");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        data['products'].forEach((value) => {
              products.add(Product(
                name: value['pname'],
                price: value['pprice'],
                desc: value['pdesc'],
                id: value['id'].toString(),
              ))
            });

        return products;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

// ... other imports and code ...

  static updateProduct(id, body) async {
    print("Request Body: $body");
    var url = Uri.parse("${baseUrl}update/$id");

    final res = await http.put(url, body: jsonEncode(body), headers: {
      'Content-Type':
          'application/json', // Add this header to indicate the request body format
    });

    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("failed to update data");
    }
  }

  static deleteProduct(id) async {
    var url = Uri.parse("${baseUrl}delete/$id");

    final res = await http.post(url);

    if (res.statusCode == 204) {
      print(jsonDecode(res.body));
    } else {
      print("failed to delete data");
    }
  }
}
