import 'package:bloc/bloc.dart';
import 'package:crypto_price_tracker_app/domain/entites/trending/trending.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';
part 'crypto_list_bloc.freezed.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  final List<Trending> _trending = [
    Trending(id: 1, name: 'asdfsadfasldf'),
    Trending(id: 2, name: 'fff'),
    Trending(id: 3, name: '9999'),
  ];

  CryptoListBloc() : super(const _Initial()) {
    on<CryptoListEvent>((event, emit) async {
      await event.when(
        started: () {},
        getMostVisited: () async {
          emit(const CryptoListState.loading());
          await Future.delayed(const Duration(seconds: 3), () {
            emit(CryptoListState.loaded(_trending));
            print('One second has passed.'); // Prints after 3 second.
          });
        },
      );
    });
  }
}
