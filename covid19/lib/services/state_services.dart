import 'dart:convert';

import 'package:covid19/models/world_state_model.dart';
import 'package:covid19/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> fetchWorldStateRecord()async{
    final response = await http.get(Uri.parse(AppUrl.worldStateApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    }
    else{
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countriesListData()async{
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if(response.statusCode == 200){
      data = jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception('Error');
    }
  }
}