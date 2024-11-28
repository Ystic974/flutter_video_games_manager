class OneTimeEvent<T> {
  OneTimeEvent(this.data);

  final T data;
  bool _consumed = false;

  T? consume() {
    if (!_consumed) {
      _consumed = true;

      return data;
    } else {
      return null;
    }
  }

  T? peek() {
    return !_consumed ? data : null;
  }
}
