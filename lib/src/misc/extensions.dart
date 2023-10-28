extension StringExtension on String {
  sentenceCase() {
    var newString = this[0].toUpperCase();
    return replaceRange(0, 1, newString);
  }
}
