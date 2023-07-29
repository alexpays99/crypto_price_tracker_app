import 'package:bloc/bloc.dart';
import 'package:crypto_price_tracker_app/core/dependencies.dart';
import 'package:crypto_price_tracker_app/data/models/crypto_coin/crypto_coin.dart';
import 'package:crypto_price_tracker_app/domain/usecases/get_most_visited_crypto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';
part 'crypto_list_bloc.freezed.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final _getMostVisitedCrypto = getIt.get<GetMostVisited>();

  CryptoListBloc() : super(const _Initial()) {
    on<CryptoListEvent>((event, emit) async {
      await event.when(
        started: () {},
        getMostVisited: () async {
          try {
            emit(const CryptoListState.loading());
            final trending = await _getMostVisitedCrypto.call();
            final trendingMapped =
                trending.map((e) => CryptoCoin.fromEntity(e)).toList();
            emit(CryptoListState.loaded(trendingMapped));
          } catch (e) {
            emit(const CryptoListState.error('error'));
            print(e);
          }
        },
      );
    });
  }
}
