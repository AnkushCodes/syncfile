import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'db.dart';
import 'model.dart';

class RepoData extends ChangeNotifier {
  static DatabaseHelper dbHelper;
  RepoData() {
    init();
  }

  init() async{
    dbHelper =  DatabaseHelper.instance;
  }
  List<Citybeans> citybeans = [];

  getData() async {
    var data = await dbHelper.queryAllRows();
    List<Citybeans> values = [];
    data.forEach((element) {
      values.add(Citybeans.fromJson(element));
    });
     citybeans = values;
     notifyListeners();
     getDataService();
  }


    getDataService() async {
    try {
      String link = "https://api.openbrewerydb.org/breweries";
      var response = await http.get(link);
      if (response.statusCode == 200) {
        var value = json.decode(response.body);
        List<Citybeans> values = [];
        value.forEach((element) {
          values.add(Citybeans.fromJson(element));
        });
        
        if(citybeans.length > 0) await dbHelper.delete();
        
        await dbHelper.insert(values);
        citybeans = values;
      notifyListeners();
      } else {
        //return null;
      }
    } catch (e) {
      print(e);
    }
  }
}
