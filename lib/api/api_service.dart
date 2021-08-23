import 'package:gamespace_memberapi/provider/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../provider/StorageUtil.dart';
import 'api_login.dart';

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    final response = await http.post(Uri.parse(ApiUrl.strApiLogin),
        body: requestModel.toJson());
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 400) {
      Map<String, dynamic> data = json.decode(response.body);

      if (data['accessToken'] != null) {
        await StorageUtil.getInstance();
        StorageUtil.putString("token", data['accessToken']);
      } else {
        await StorageUtil.getInstance();
        StorageUtil.putString("token", 'none');
      }
      print(data);

      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
