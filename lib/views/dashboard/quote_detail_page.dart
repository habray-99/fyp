import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/quotes.dart';

class QuoteDetailPage extends StatelessWidget {
  final Quote quote;
  final QuoteRepository quoteRepository = QuoteRepository();

  QuoteDetailPage({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quote.author),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'quote-${quoteRepository.getQuotes().indexOf(quote)}',
                  child: Text(
                    quote.text,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                // Add any additional buttons or actions here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
