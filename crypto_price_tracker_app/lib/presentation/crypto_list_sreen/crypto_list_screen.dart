import 'package:crypto_price_tracker_app/presentation/crypto_info_screen/crypto_info_screen.dart';
import 'package:crypto_price_tracker_app/presentation/crypto_list_sreen/bloc/crypto_list_bloc.dart';
import 'package:crypto_price_tracker_app/presentation/crypto_list_sreen/widgets/coin_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});

  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocConsumer<CryptoListBloc, CryptoListState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            loading: () => const Center(
              child: CupertinoActivityIndicator(),
            ),
            loaded: (trending) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: trending.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                CryptoInfoScreen(currency: trending[index]),
                          ),
                        );
                      },
                      child: CoinCard(
                        name: trending[index].name ?? '',
                        symbol: trending[index].symbol ?? '',
                        imageUrl: trending[index].image ?? '',
                        price: trending[index].currentPrice,
                        change: trending[index].priceChange24h ?? '',
                        changePercentage:
                            trending[index].priceChangePercentage24h,
                      ),
                    );
                  },
                ),
              );
            },
            error: (message) {
              return Center(
                child: Text(message),
              );
            },
          );
        },
      ),
    );
  }
}
