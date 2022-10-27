import 'dart:convert';
import '../ApiConstans.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:nextparty/models/party.dart';

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
  static Future<List<Party>> getParties() async {
    var response = await http.get(Uri.parse(ApiConstans.parties));
    if (response.statusCode == 200) {
      var parties = json.decode(response.body) as List;
      return parties.map((party) => Party.fromJson(party)).toList();
    } else {
      throw Exception('Failed to load parties');
    }
  }

  Future<String?> createParty(PartyDto party) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(ApiConstans.user + "${prefs.getString('id')}");
    var token = prefs.getString('token');
    var response = await http.post(
        Uri.parse(ApiConstans.user + "${prefs.getString('id')}"),
        headers: {
          "Authorization": "Bearer $token"
        },
        body: {
          "name": party.name,
          "description": party.description,
          "date": party.date,
          "location": party.location
        });
    return response.body;
    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }
}
