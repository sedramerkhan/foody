extension MapExtensions on Map<dynamic, dynamic> {
  void mapIndexed<T>(void Function(int index, dynamic key, dynamic value) f) {
    int index = 0;
    forEach((key, value) {
      f(index, key, value);
      index++;
    });
  }
}

extension IterableMapEntryExtensions<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(R Function(int index, T item) f) {
    int index = 0;
    return map((item) {
      final result = f(index, item);
      index++;
      return result;
    });
  }
}
