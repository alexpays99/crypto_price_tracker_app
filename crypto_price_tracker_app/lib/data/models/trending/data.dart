import 'package:crypto_price_tracker_app/domain/entities/trending/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'datum.dart';
import 'status.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data extends DataEntity with _$Data {
  factory Data({
    List<Datum>? data,
    Status? status,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
