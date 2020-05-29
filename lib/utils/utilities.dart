class Utils {
  static String getUsername(String email) {
    return "aoura:${email.split('@')[0]}";
  }
}