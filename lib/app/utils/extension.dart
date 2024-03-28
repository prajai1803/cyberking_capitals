extension StringExtension on String {
  String reduceTo(int n) {
    if (n >= length) {
      return this;
    }
    return substring(0, n);
  }
}
