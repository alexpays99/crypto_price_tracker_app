part of 'crypto_list_bloc.dart';

@freezed
class CryptoListState with _$CryptoListState {
  const factory CryptoListState.initial() = _Initial;
  const factory CryptoListState.loading() = _Loading;
  const factory CryptoListState.loaded(List<Datum> trending) = _Loaded;
  const factory CryptoListState.error(String message) = _Error;
}
