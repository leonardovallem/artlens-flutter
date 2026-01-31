import 'package:artlens/shared/util/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("given failure result, then onSuccess should not be called", () {
    var onSuccessCalled = false;
    final result = Result<int>.failure(Exception("Test Exception"));

    result.onSuccess((data) {
      onSuccessCalled = true;
    });

    expect(onSuccessCalled, false);
  });

  test("given success result, then onFailure should not be called", () {
    var onFailureCalled = false;
    final result = Result<int>.success(42);

    result.onFailure((exception) {
      onFailureCalled = true;
    });

    expect(onFailureCalled, false);
  });

  test("given failure result, then onFailure should  be called", () {
    var onFailureCalled = false;
    final result = Result<int>.failure(Exception("Test Exception"));

    result.onFailure((exception) {
      onFailureCalled = true;
    });

    expect(onFailureCalled, true);
  });

  test("given success result, then onSuccess should be called", () {
    var onSuccessCalled = false;
    final result = Result<int>.success(42);

    result.onSuccess((data) {
      onSuccessCalled = true;
    });

    expect(onSuccessCalled, true);
  });
}
