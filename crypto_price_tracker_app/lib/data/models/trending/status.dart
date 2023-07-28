import 'package:crypto_price_tracker_app/domain/entities/trending/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';
part 'status.g.dart';

@freezed
class Status extends StatusEntity with _$Status {
  factory Status({
    DateTime? timestamp,
    @JsonKey(name: 'error_code') int? errorCode,
    @JsonKey(name: 'error_message') dynamic errorMessage,
    int? elapsed,
    @JsonKey(name: 'credit_count') int? creditCount,
    dynamic notice,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}
