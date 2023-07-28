import 'package:crypto_price_tracker_app/domain/entities/trending/quote.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'btc.dart';
import 'usd.dart';

part 'quote.freezed.dart';
part 'quote.g.dart';

@freezed
class Quote extends QuoteEntity with _$Quote {
  factory Quote({
    @JsonKey(name: 'USD') Usd? usd,
    @JsonKey(name: 'BTC') Btc? btc,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}
