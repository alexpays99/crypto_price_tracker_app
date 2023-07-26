import 'package:crypto_price_tracker_app/domain/entities/trending/status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';
part 'status.g.dart';

@freezed
class Status extends StatusEntity with _$Status {
  factory Status({
    DateTime? timestamp,
    int? errorCode,
    dynamic errorMessage,
    int? elapsed,
    int? creditCount,
    dynamic notice,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}
