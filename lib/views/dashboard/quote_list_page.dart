import 'package:flutter/material.dart';
import 'package:fyp/views/dashboard/quote_detail_page.dart';
import 'package:get/get.dart';

import '../../model/quotes.dart';


class QuoteListPage extends StatelessWidget {
 final QuoteRepository quoteRepository = QuoteRepository();

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
      ),
      body: ListView.builder(
        itemCount: quoteRepository.getQuotes().length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Hero(
              tag: 'quote-$index',
              child: Text(quoteRepository.getQuotes()[index].text, style: TextStyle(fontSize: 18)),
            ),
            subtitle: Text(quoteRepository.getQuotes()[index].author),
            onTap: () => Get.to(() => QuoteDetailPage(quote: quoteRepository.getQuotes()[index])),
          );
        },
      ),
    );
 }
}
