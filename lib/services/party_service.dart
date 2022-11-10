import 'dart:convert';
import '../common/apiConstans.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:nextparty/models/party.dart';

import '../preferences/preferences.dart';

class PartyDto {
  String name;
  String description;
  String date;
  String location;

  PartyDto(
      {required this.name,
      required this.description,
      required this.date,
      required this.location});

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "date": date,
        "location": location,
      };
}

class partyService {
  Future<String?> getParties() async {
    // static Future<List<Party>> getParties() async {
    Preferences prefs = Preferences();
    await prefs.init();
    var id = await prefs.getId();
    var token = await prefs.getToken();
    var response = await http.get(
        Uri.parse(ApiConstans().getPartiesOfUserUrl(id!)),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      return response.body;
      // var parties = json.decode(response.body) as List;
      // return parties;
      //convert json array to list of parties
      // return partyFromJsonList(response.body);
    } else {
      throw Exception('Failed to load parties');
    }
  }

  Future<String?> createParty(PartyDto party) async {
    Preferences prefs = Preferences();
    await prefs.init();
    var id = await prefs.getId();
    var token = await prefs.getToken();
    var response = await http
        .post(Uri.parse(ApiConstans().getCreatePartyUrl(id!)), headers: {
      "Authorization": "Bearer $token"
    }, body: {
      "name": party.name,
      "description": party.description,
      "date": party.date,
      "location": party.location
    });
    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }
}
