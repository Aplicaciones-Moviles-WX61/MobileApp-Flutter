import 'package:nextparty/models/item.dart';
import 'package:http/http.dart' as http;
import '../common/apiConstans.dart';
import '../preferences/preferences.dart';

class ItemsService {
  Future<String?> getItems(int party_id) async {
    Preferences prefs = Preferences();
    await prefs.init();
    var token = await prefs.getToken();
    var response = await http.get(Uri.parse(Paths().itemsUrl(party_id)),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<String?> addItem(int party_id, AddItemDto item) async {
    Preferences prefs = Preferences();
    await prefs.init();
    var token = await prefs.getToken();
    var response =
        await http.post(Uri.parse(Paths().itemsUrl(party_id)), headers: {
      "Authorization": "Bearer $token"
    }, body: {
      "name": item.name,
      "description": item.description,
      "quantity": item.quantity.toString(),
      "category_id": '1',
    });
    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<String?> updateItem(int item_id, AddItemDto item) async {
    Preferences prefs = Preferences();
    await prefs.init();
    var token = await prefs.getToken();
    var response =
        await http.put(Uri.parse(Paths().updateItem(item_id)), headers: {
      "Authorization": "Bearer $token"
    }, body: {
      "name": item.name,
      "description": item.description,
      "quantity": item.quantity.toString(),
      "category_id": '1',
    });
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}

class AddItemDto {
  String? name;
  String? description;
  int? quantity;
  int? category_id;
  AddItemDto({this.name, this.description, this.quantity, this.category_id});
}
