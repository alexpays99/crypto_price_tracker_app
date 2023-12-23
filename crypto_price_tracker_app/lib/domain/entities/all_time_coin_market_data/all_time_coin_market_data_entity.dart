class AllTimeCoinMarketDataEntity {
  List<List<num>>? prices;
  final List<List<num>>? marketCaps;
  final List<List<num>>? totalVolumes;

  AllTimeCoinMarketDataEntity({
    this.prices,
    this.marketCaps,
    this.totalVolumes,
  });
}
