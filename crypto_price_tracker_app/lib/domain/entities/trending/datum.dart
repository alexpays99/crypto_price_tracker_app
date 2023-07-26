import 'quote.dart';

class DatumEntity {
  final int? id;
  final String? name;
  final String? symbol;
  final String? slug;
  final int? cmcRank;
  final int? numMarketPairs;
  final int? circulatingSupply;
  final int? totalSupply;
  final int? maxSupply;
  final DateTime? lastUpdated;
  final DateTime? dateAdded;
  final List<String>? tags;
  final dynamic platform;
  final QuoteEntity? quote;

  DatumEntity({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.cmcRank,
    required this.numMarketPairs,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.lastUpdated,
    required this.dateAdded,
    required this.tags,
    required this.platform,
    required this.quote,
  });
}
