sealed class Result<T> {
  const Result();

  factory Result.success(T value) = Success<T>;
  factory Result.failure(Exception error) = Failure<T>;

  R when<R>({
    required R Function(T value) success,
    required R Function(Exception error) failure,
  }) => switch (this) {
        Success(:final value) => success(value),
        Failure(:final error) => failure(error),
      };
}

final class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

final class Failure<T> extends Result<T> {
  final Exception error;
  const Failure(this.error);
}
