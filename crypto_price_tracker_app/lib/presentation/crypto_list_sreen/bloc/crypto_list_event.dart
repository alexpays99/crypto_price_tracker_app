part of 'crypto_list_bloc.dart';

@freezed
class CryptoListEvent with _$CryptoListEvent {
  const factory CryptoListEvent.started() = _Started;
  const factory CryptoListEvent.getMostVisited() = _GetMostVisited;
}
