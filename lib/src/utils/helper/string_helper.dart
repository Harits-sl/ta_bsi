class StringHelper {
  /// split string dari (-), return dari list pertama
  static splitId(String input) {
    List parts = input.split('-');
    return parts[0];
  }
}
