// import 'package:flutter/material.dart';
// import 'package:fyp/controller/dashboard/quote_controller.dart';
// import 'package:fyp/views/dashboard/quote_detail_page.dart';
// import 'package:get/get.dart';

// class QuoteListPage extends StatelessWidget {
//   final QuoteController quoteController = Get.put(QuoteController());
//   final ScrollController _scrollController = ScrollController();

//   QuoteListPage({super.key});

//   // @override
//   void initState() {
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         quoteController.fetchQuotes();
//       }
//     });
//     // super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quotes'),
//       ),
//       body: Obx(() => ListView.builder(
//             controller: _scrollController,
//             itemCount: quoteController.quotes.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Hero(
//                   tag: 'quote-$index',
//                   child: Text(
//                     quoteController.quotes[index].quotes ?? 'No quote',
//                     // style: const TextStyle(fontSize: 18),
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                 ),
//                 subtitle: Text(
//                     quoteController.quotes[index].quotesAuthor ?? 'No author'),
//                 onTap: () => Get.to(() =>
//                     QuoteDetailPage(quote: quoteController.quotes[index])),
//               );
//             },
//           )),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fyp/controller/dashboard/quote_controller.dart';
import 'package:fyp/views/dashboard/quote_detail_page.dart';
import 'package:get/get.dart';

class QuoteListPage extends StatelessWidget {
  final QuoteController quoteController = Get.put(QuoteController());
  final ScrollController _scrollController = ScrollController();

  QuoteListPage({super.key});

  // @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        quoteController.fetchQuotes();
      }
    });
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
      ),
      body: Obx(() => ListView.builder(
            controller: _scrollController,
            itemCount: quoteController.quotes.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Hero(
                    tag: 'quote-${quoteController.quotes[index].quotesId}',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        quoteController.quotes[index].quotes ?? 'No quote',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  subtitle: Text(quoteController.quotes[index].quotesAuthor ??
                      'No author'),
                  onTap: () => Get.to(() =>
                      QuoteDetailPage(quote: quoteController.quotes[index])),
                ),
              );
            },
          )),
    );
  }
}
