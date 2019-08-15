import 'package:flutter_app/model/home_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomeDao{
  static Future<HomeModel> fetch() async {
    final String fetchUrl = "http://www.devio.org/io/flutter_app/json/home_page.json";
    http.Response response = await http.get(fetchUrl);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw("啊啊啊：get home data failed!");
    }
  }
}