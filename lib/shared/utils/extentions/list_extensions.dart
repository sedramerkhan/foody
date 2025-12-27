extension ListMapIndexedExtension<T> on List<T> {
  List<R> mapIndexed<R>(R Function(int index, T value) transform) {
    return asMap().entries.map((entry) => transform(entry.key, entry.value)).toList();
  }
}


extension JoinToStringExtension<T> on List<T> {
String joinToString({
  String separator = ", ",
  String prefix = "",
  String postfix = "",
  String Function(T)? transform,
}) {
  return map((e) => transform != null ? transform(e) : e.toString())
      .join(separator)
      .padLeft(prefix.length, prefix)
      .padRight(postfix.length, postfix);
}
}

extension ForEachIndexed<T> on List<T> {
  // This method allows you to iterate through the list with both index and item
  void forEachIndexed(void Function(int index, T item) action) {
    for (int i = 0; i < length; i++) {
      action(i, this[i]);
    }
  }
}
