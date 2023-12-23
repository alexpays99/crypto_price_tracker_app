import 'package:bloc/bloc.dart';
import 'package:crypto_price_tracker_app/core/dependencies.dart';
import 'package:crypto_price_tracker_app/domain/usecases/get_historical_coin_market_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_info_event.dart';
part 'crypto_info_state.dart';
part 'crypto_info_bloc.freezed.dart';

class CryptoInfoBloc extends Bloc<CryptoInfoEvent, CryptoInfoState> {
  final _getHistoricalCoinsMarketData =
      getIt.get<GetHistoricalCoinMarketData>();

  CryptoInfoBloc() : super(const _Initial()) {
    on<CryptoInfoEvent>((event, emit) async {
      await event.when(
        started: () {},
        getHistoricalCoinsMarketData: (coinId, from, to) async {
          emit(const CryptoInfoState.loading());
          try {
            final allTimeCoinMarketData =
                await _getHistoricalCoinsMarketData.call(coinId, from, to);
            final trendingMapped = allTimeCoinMarketData.prices ?? [];
            print('trendingMapped : $trendingMapped');
            emit(CryptoInfoState.loaded(trendingMapped));
          } catch (e) {
            emit(const CryptoInfoState.error('error'));
            print(e);
          }
        },
      );
    });
  }
}
