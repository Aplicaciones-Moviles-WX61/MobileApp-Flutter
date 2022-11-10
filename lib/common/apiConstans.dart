class ApiConstans {
  static const String base = "https://next-party-api.azurewebsites.net/api/v1/";
  static const String login = base + "auth/login";
  static const String register = base + "auth/register";
  static const String user = base + "users/";
  static const String parties = base + "parties";
  static const String wishlist = base + "party";
  static const String items = base + "items";

  getCreatePartyUrl(int userId) {
    return user + userId.toString() + "/party";
  }

  getPartiesOfUserUrl(int userId) {
    return parties + "/user/" + userId.toString();
  }

  getWishlistUrl(int partyId) {
    return wishlist + "/" + partyId.toString() + "/wishlist";
  }

  addWishlistUrl(int partyId) {
    return wishlist + "/" + partyId.toString() + "/wishlist/create";
  }

  itemsUrl(int partyId) {
    return wishlist + "/" + partyId.toString() + "/items";
  }
}
