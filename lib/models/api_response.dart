class ApiResponse<T> {
  late final bool success;
  late final bool error;
  // ignore: unnecessary_question_mark
  late final dynamic? data;
  late final message;
  late final code;

  late final String id;

  ApiResponse({
    required this.success,
    required this.data,
    this.id = "",
    this.error = true,
    this.message = "",
    this.code = 00,
  });

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      success: map['success'] ?? false,
      error: map['error'] ?? true,
      data: map['data'],
      id: map['id'] ?? "",
    );
  }
}
