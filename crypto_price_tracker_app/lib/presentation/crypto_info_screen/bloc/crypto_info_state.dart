part of 'crypto_info_bloc.dart';

@freezed
class CryptoInfoState with _$CryptoInfoState {
  const factory CryptoInfoState.initial() = _Initial;
  const factory CryptoInfoState.loading() = _Loading;
  const factory CryptoInfoState.loaded(List<List<num>> historyPrices) = _Loaded;
  const factory CryptoInfoState.error(String message) = _Error;
}
