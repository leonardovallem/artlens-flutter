extension IterableExtensions<E> on Iterable<E> {
  Iterable<T> mapNotNull<T>(T? Function(E e) toElement) {
    return expand((e) {
      final result = toElement(e);
      return result == null ? [] : [result];
    });
  }
}