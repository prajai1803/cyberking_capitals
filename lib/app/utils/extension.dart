extension StringExtension on String {
  String reduceTo(int n) {
    if (n >= length) {
      return this;
    }
    return substring(0, n);
  }
}

extension SecondsToHHMMExtension on int {
  String toHHMM() {
    int hours = this ~/ 3600;
    int minutes = (this % 3600) ~/ 60;
    return '$hours hr :${minutes.toString().padLeft(2, '0')} min';
  }
}
