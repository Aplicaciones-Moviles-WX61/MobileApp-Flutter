class ApiConstans {
  static const String base = "https://next-party-api.azurewebsites.net/api/v1/";
  static const String login = base + "auth/login";
  static const String register = base + "auth/register";
  static const String user = base + "users/";
  static const String parties = base + "parties";

  getCreatePartyUrl(int userId) {
    return user + userId.toString() + "/party";
  }

  getPartiesOfUserUrl(int userId) {
    return parties + "/user/" + userId.toString();
  }
}
