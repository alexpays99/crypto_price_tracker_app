class CryptoCoinEntity {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final dynamic currentPrice;
  final dynamic marketCap;
  final dynamic marketCapRank;
  final dynamic fullyDilutedValuation;
  final dynamic totalVolume;
  final dynamic high24h;
  final dynamic low24h;
  final dynamic priceChange24h;
  final dynamic priceChangePercentage24h;
  final dynamic marketCapChange24h;
  final dynamic marketCapChangePercentage24h;
  final dynamic circulatingSupply;
  final dynamic totalSupply;
  final dynamic maxSupply;
  final dynamic ath;
  final dynamic athChangePercentage;
  final DateTime? athDate;
  final dynamic atl;
  final dynamic atlChangePercentage;
  final DateTime? atlDate;
  final dynamic roi;
  final DateTime? lastUpdated;

  CryptoCoinEntity({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.marketCapChange24h,
    required this.marketCapChangePercentage24h,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    required this.roi,
    required this.lastUpdated,
  });
}
