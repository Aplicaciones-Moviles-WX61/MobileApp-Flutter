class Paths {
  static const String base = "https://next-party-api.azurewebsites.net/api/v1/";
  static const String login = "${base}auth/login";
  static const String register = "${base}auth/register";
  static const String user = "${base}users/";
  static const String parties = "${base}parties";
  static const String wishlist = "${base}party";
  static const String items = "${base}items";

  getCreatePartyUrl(int userId) {
    return "$user$userId/party";
  }

  getPartiesOfUserUrl(int userId) {
    return "$parties/user/$userId";
  }

  getWishlistUrl(int partyId) {
    return "$wishlist/$partyId/wishlist";
  }

  addWishlistUrl(int partyId) {
    return "$wishlist/$partyId/wishlist/create";
  }

  itemsUrl(int partyId) {
    return "$wishlist/$partyId/items";
  }

  getPartyUrl(int partyId) {
    return "$parties/$partyId";
  }

  getGuestsUrl(int partyId) {
    return "$parties/$partyId/guests";
  }

  inviteGuestUrl(int partyId) {
    return "$parties/$partyId/invite";
  }

  updateItem(int itemId) {
    return "$wishlist/1/items/$itemId";
  }
}
