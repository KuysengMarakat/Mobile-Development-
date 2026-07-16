class ButtonStatus {
  ButtonStatus({required this.title, required this.selected});

  final String title;
  final bool selected;
}

class RepositoryException implements Exception {
  final String message;

  RepositoryException(this.message);
}

AsyncData<ButtonStatus> data = AsyncData.loading();


enum AsyncState { loading, success, error }
class AsyncData<V> {
  final V? value;
  final String? error;
  final AsyncState state;

  AsyncData.loading() : value = null, error = null, state = AsyncState.loading;
  AsyncData.success(this.value) : error = null, state = AsyncState.success;
  AsyncData.error(this.error) : value = null, state = AsyncState.error;
}