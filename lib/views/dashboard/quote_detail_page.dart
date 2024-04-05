// import 'package:flutter/material.dart';

// import '../../model/quotes.dart';

// class QuoteDetailPage extends StatelessWidget {
//  final Quote quote;

//  QuoteDetailPage({super.key, required this.quote});

//  @override
//  Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(quote.quotesAuthor ?? 'Unknown Author'),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Hero(
//                  tag: 'quote-${quote.quotesId}', // Assuming quotesId is unique for each quote
//                  child: Text(
//                     quote.quotes ?? 'No quote',
//                     style: Theme.of(context).textTheme.headlineMedium,
//                  ),
//                 ),
//                 // Add any additional buttons or actions here
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//  }
// }
import 'package:flutter/material.dart';
import '../../model/quotes.dart';

class QuoteDetailPage extends StatelessWidget {
  final Quote quote;

  const QuoteDetailPage({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quote.quotesAuthor ?? 'Unknown Author'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: 'quote-${quote.quotesId}',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        quote.quotes ?? 'No quote',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Add any additional buttons or actions here
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
