sealed class Result<T> {
  const Result();

  factory Result.success(T data) = Success<T>;
  factory Result.failure(Object error) = Failure<T>;

  Result<T> onSuccess(void Function(T data) action) {
    if (this is Success<T>) action((this as Success<T>).data);
    return this;
  }

  Result<T> onFailure(void Function(Object error) action) {
    if (this is Failure<T>) action((this as Failure<T>).error);
    return this;
  }

  Result<T> onException(void Function(Exception exception) action) {
    if (this is Failure<T>) {
      final error = (this as Failure<T>).error;
      if (error is Exception) {
        action(error);
      }
    }
    return this;
  }

  R fold<R>({
    required R Function(T data) onSuccess,
    required R Function(Object error) onFailure,
  }) {
    if (this is Success<T>) return onSuccess((this as Success<T>).data);
    if (this is Failure<T>) return onFailure((this as Failure<T>).error);
    throw StateError('Unhandled Result type');
  }
}

Result<T> runCatching<T>(T Function() block) {
  try {
    return Result.success(block());
  } catch (e) {
    return Result.failure(e);
  }
}

Future<Result<T>> runCatchingAsync<T>(Future<T> Function() block) async {
  try {
    final result = await block();
    return Result.success(result);
  } catch (e) {
    return Result.failure(e);
  }
}

final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

final class Failure<T> extends Result<T> {
  final Object error;
  const Failure(this.error);
}