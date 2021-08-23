import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamespace_memberapi/provider/StorageUtil.dart';
import 'package:gamespace_memberapi/api/api_profile.dart';
import 'package:gamespace_memberapi/provider/globals.dart';
import 'package:gamespace_memberapi/model/box_profile.dart';
import 'package:http/http.dart' as http;

class AdminListMember extends StatefulWidget {
  @override
  _AdminListMemberState createState() => _AdminListMemberState();
}

class _AdminListMemberState extends State<AdminListMember> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var tokenData = StorageUtil.getString("token");

  @override
  void initState() {
    super.initState();
    getTokenMember();
  }

  Future<TokenMember> getTokenMember() async {
    String token = tokenData.trim();
    var url = ApiUrl.strApiProfile;
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    print(response);
    TokenMember dataFromAPI = tokenMemberFromJson(response.body);
    print(tokenData);
    print(url);
    print(dataFromAPI.firstname); //json => dart object
    return dataFromAPI;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(title: Text('Admin list all member ')),
        body: FutureBuilder(
          future: getTokenMember(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var result = snapshot.data;
              return ListView(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  BaseBox("Firstname", result.firstname.toString(),
                      Colors.amberAccent),
                  SizedBox(
                    height: 15,
                  ),
                  BaseBox('Lastname', result.lastname.toString(),
                      Colors.amberAccent),
                  SizedBox(
                    height: 15,
                  ),
                  BaseBox("email", result.email.toString(), Colors.amberAccent),
                  SizedBox(
                    height: 15,
                  ),
                  BaseBox(
                      'mobile', result.mobile.toString(), Colors.amberAccent),
                  SizedBox(
                    height: 15,
                  ),
                  BaseBox(
                      'country', result.country.toString(), Colors.amberAccent),
                  SizedBox(
                    height: 15,
                  ),
                ],
              );
            }
            return LinearProgressIndicator();
          },
        ));
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
