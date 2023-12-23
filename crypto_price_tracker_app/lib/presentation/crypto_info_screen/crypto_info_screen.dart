import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_price_tracker_app/core/app_data.dart/app_data.dart';
import 'package:crypto_price_tracker_app/data/models/crypto_coin/crypto_coin.dart';
import 'package:crypto_price_tracker_app/presentation/crypto_info_screen/bloc/crypto_info_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CryptoInfoScreen extends StatefulWidget {
  const CryptoInfoScreen({
    super.key,
    required this.currency,
  });

  final CryptoCoin currency;

  @override
  State<CryptoInfoScreen> createState() => _CryptoInfoScreenState();
}

class _CryptoInfoScreenState extends State<CryptoInfoScreen> {
  late List<Color> color = <Color>[];
  late List<double> stops = <double>[];
  late LinearGradient gradientColors = LinearGradient(
      colors: color,
      stops: stops,
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);

  final currentTime = DateTime.now();
  final day = const Duration(days: 1);
  final sevenDays = const Duration(days: 7);
  final month = const Duration(days: 7);

  @override
  void initState() {
    final dayAgo = currentTime.subtract(day).millisecondsSinceEpoch / 1000;
    print(
        '1 day ago in TIMESTAMP: from $dayAgo to ${currentTime.millisecondsSinceEpoch / 1000}');
    final sevenDaysAgo =
        currentTime.subtract(sevenDays).millisecondsSinceEpoch / 1000;
    print(
        '7 days ago time in TIMESTAMP: from $sevenDaysAgo to ${currentTime.millisecondsSinceEpoch / 1000}');

    super.initState();
    context.read<CryptoInfoBloc>().add(
          CryptoInfoEvent.getHistoricalCoinsMarketData(
            widget.currency.id ?? '',
            (currentTime.subtract(day).millisecondsSinceEpoch / 1000)
                .toString(),
            (currentTime.millisecondsSinceEpoch / 1000).toString(),
          ),
        );
    color.add(const Color.fromARGB(0, 227, 242, 253));
    color.add(const Color.fromARGB(77, 144, 202, 249));
    color.add(const Color.fromARGB(255, 33, 149, 243));
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);
  }
  // (String, String) getRange(Map<String, dynamic> button) {
  //   switch (timePeriods.indexed) {
  //     case 0:

  //       return ;
  //     default:
  //   }
  // }

  void onPressed(Map<String, dynamic> button) {
    final timePeriods = AppData.timePeriods;
    setState(() {
      for (var element in timePeriods) {
        element['active'] = false;
      }
      button['active'] = true;
    });
    context.read<CryptoInfoBloc>().add(
          CryptoInfoEvent.getHistoricalCoinsMarketData(
            widget.currency.id ?? '',
            (currentTime.subtract(day).millisecondsSinceEpoch / 1000)
                .toString(),
            (currentTime.millisecondsSinceEpoch / 1000).toString(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 32, 52),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 32, 52),
        title: Text(
          widget.currency.name ?? '',
          style: const TextStyle(color: Colors.white),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.star_outline,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 1.25,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 38, 41, 59),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Column(
                        children: [
                          Text(
                            '\$${widget.currency.currentPrice}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Change ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                widget.currency.priceChangePercentage24h
                                            .toDouble() <
                                        0
                                    ? '${widget.currency.priceChangePercentage24h.toDouble()}%'
                                    : '+${widget.currency.priceChangePercentage24h.toDouble()}%',
                                style: TextStyle(
                                  color:
                                      widget.currency.priceChangePercentage24h >
                                              0
                                          ? Colors.green
                                          : Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: BlocBuilder<CryptoInfoBloc, CryptoInfoState>(
                              builder: (context, state) {
                                return state.when(
                                  initial: () => Container(),
                                  loading: () =>
                                      const CupertinoActivityIndicator(),
                                  loaded: (list) {
                                    final l = list
                                        .map((e) => HistoryData(e[0], e[1]))
                                        .toList();
                                    return SfCartesianChart(
                                      // Initialize category axis
                                      primaryXAxis: CategoryAxis(),
                                      series: [
                                        AreaSeries<HistoryData, num>(
                                          gradient: gradientColors,
                                          dataSource: l,
                                          xValueMapper: (priceInfo, _) =>
                                              priceInfo.datetime,
                                          yValueMapper: (priceInfo, _) =>
                                              priceInfo.price,
                                          animationDelay: 3.0,
                                        ),
                                      ],
                                    );
                                  },
                                  error: (message) => Center(
                                    child: Text(message),
                                  ),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: AppData.timePeriods.length,
                                itemBuilder: (context, index) {
                                  final timePeriod = AppData.timePeriods[index];
                                  return GestureDetector(
                                    onTap: () {
                                      onPressed(timePeriod);
                                    },
                                    child: Container(
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: AppData.timePeriods[index]
                                                ['active']
                                            ? const Color.fromARGB(
                                                255, 28, 32, 52)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(5),
                                        // border: Border.all(
                                        //   color: Colors.white,
                                        // ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 1,
                                          horizontal: 4,
                                        ),
                                        child: Center(
                                          child: Text(
                                            AppData.timePeriods[index]['date'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CachedNetworkImage(
                  imageUrl: widget.currency.image ?? '',
                  width: 80,
                  height: 80,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryData {
  HistoryData(this.datetime, this.price);
  final num datetime;
  final num price;

  HistoryData copyWith({
    num? datetime,
    num? price,
  }) {
    return HistoryData(
      price ?? this.price,
      datetime ?? this.datetime,
    );
  }
}
