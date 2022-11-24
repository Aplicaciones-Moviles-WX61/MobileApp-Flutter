import 'package:nextparty/models/wishlist.dart';
import 'package:http/http.dart' as http;
import '../common/apiConstans.dart';
import '../preferences/preferences.dart';

class WishlistService {
  Future<String?> getWishlist(int party_id) async {
    Preferences prefs = Preferences();
    await prefs.init();
    var token = await prefs.getToken();
    var response = await http.get(Uri.parse(Paths().getWishlistUrl(party_id)),
        headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<String?> addWishlist(int party_id, Wishlist wishlist) async {
    Preferences prefs = Preferences();
    await prefs.init();
    var token = await prefs.getToken();
    var response =
        await http.post(Uri.parse(Paths().addWishlistUrl(party_id)), headers: {
      "Authorization": "Bearer $token"
    }, body: {
      "description": wishlist.description,
    });
    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }
}
