class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});
}

class QuoteRepository {
  final List<Quote> quotes = [
    Quote(
        text: 'The only way to do great work is to love what you do.',
        author: 'Steve Jobs'),
    Quote(
        text:
            'Success is not the key to happiness. Happiness is the key to success. If you love what you are doing, you will be successful.',
        author: 'Albert Schweitzer'),
    // Add more quotes here
  ];

  List<Quote> getQuotes() {
    return quotes;
  }

  Quote getQuoteById(int id) {
    return quotes[id];
  }
}
