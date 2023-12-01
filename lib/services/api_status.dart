class APIResponse<T> {
  final T? data;
  final dynamic error;
  final bool? success;
  final int? statusCode;

  APIResponse({this.data, this.error, this.success, this.statusCode});
}
