part of 'crypto_info_bloc.dart';

@freezed
class CryptoInfoEvent with _$CryptoInfoEvent {
  const factory CryptoInfoEvent.started() = _Started;
  const factory CryptoInfoEvent.getHistoricalCoinsMarketData(
    String coinId,
    String from,
    String to,
  ) = _GetHistoricalCoinsMarketData;
}
