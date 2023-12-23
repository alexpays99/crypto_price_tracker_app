class CoinGeckoApiConstants {
  static const String baseUrl = "https://api.coingecko.com/api/v3/";

  static String get allCoinsMarketData => "${baseUrl}coins/markets";

  static String allTimeCoinsMarketData(String coinId) =>
      "${baseUrl}coins/$coinId/market_chart/range";
}
