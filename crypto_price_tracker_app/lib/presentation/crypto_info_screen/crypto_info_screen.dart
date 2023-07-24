import 'package:crypto_price_tracker_app/domain/entites/trending/trending.dart';
import 'package:flutter/material.dart';

class CryptoInfoScreen extends StatelessWidget {
  const CryptoInfoScreen({
    super.key,
    required this.currency,
  });

  final Trending currency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(currency.name ?? '')),
    );
  }
}
