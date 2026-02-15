int calculateReadingTime(String text) {
  int wordCount = text.split(RegExp(r'\s+')).length;
  int readingTime = (wordCount / 225).ceil();
  return readingTime;
}
