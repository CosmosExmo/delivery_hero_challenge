import 'package:flutter/foundation.dart';

abstract class ApiResponse {
  @protected
  late int page;
  late int totalPages;
  late int totalResults;
  late bool status;
  late String? errorMsg;

  @protected
  @mustCallSuper
  ApiResponse.fromMap(Map<String, dynamic>? map) {
    page = int.parse((map!['page'] ?? "1").toString());
    totalPages = int.parse((map['total_pages'] ?? "1").toString());
    totalResults = int.parse((map['total_results'] ?? "1").toString());
    status = !totalResults.isNegative;
  }

  @protected
  @mustCallSuper
  ApiResponse.withError(String? error) {
    page = 1;
    status = false;
    errorMsg = error;
  }

  @protected
  Map<String, dynamic> toMap();
}
