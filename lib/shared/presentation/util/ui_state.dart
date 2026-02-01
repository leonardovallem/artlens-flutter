sealed class UiState<T> {
  const UiState();

  factory UiState.success(T data) = Success<T>;
  const factory UiState.loading() = Loading<T>;
  factory UiState.failure(Object error) = Failure<T>;

  bool get isLoading => this is Loading<T>;
  Object? get errorOrNull => this is Failure<T> ? (this as Failure<T>).error : null;
  T? get dataOrNull => this is Success<T> ? (this as Success<T>).data : null;
}

final class Success<T> extends UiState<T> {
  final T data;
  const Success(this.data);
}

final class Failure<T> extends UiState<T> {
  final Object error;
  const Failure(this.error);
}

final class Loading<T> extends UiState<T> {
  const Loading();
}