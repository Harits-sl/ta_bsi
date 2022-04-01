class StringHelper {
  static splitId(String input) {
    List parts = input.split('-');
    return parts[0];
  }
}
