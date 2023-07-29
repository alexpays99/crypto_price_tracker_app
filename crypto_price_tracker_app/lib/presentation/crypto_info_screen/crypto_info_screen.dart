import 'package:crypto_price_tracker_app/data/models/crypto_coin/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoInfoScreen extends StatelessWidget {
  const CryptoInfoScreen({
    super.key,
    required this.currency,
  });

  final CryptoCoin currency;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(currency.name ?? '')),
    );
  }
}
