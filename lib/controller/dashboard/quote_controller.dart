import 'package:fyp/repo/qoutes_repo.dart';
import 'package:fyp/utils/custom_snackbar.dart';
import 'package:get/get.dart';
import '../../model/quotes.dart';

class QuoteController extends GetxController {
  // Define a Rx variable for the current quote
  Rx<Quote?> currentQuote = Rx<Quote?>(null);
  int currentPage = 1;
  int limit = 10; // Number of quotes per page

  // Method to update the current quote
  void updateQuote(Quote quote) {
    currentQuote.value = quote;
    update(); // Notify listeners about the change
  }

  // Method to clear the current quote
  void clearQuote() {
    currentQuote.value = null;
    update(); // Notify listeners about the change
  }

  final QuotesRepo getQuotesRepo = QuotesRepo();
  RxList<Quote> quotes = RxList<Quote>();

  @override
  void onInit() {
    super.onInit();
    fetchQuotes();
  }

  void fetchQuotes() async {
    try {
      await getQuotesRepo.getQuotes(
        page: 1, // Adjust the page number as needed
        limit: 10, // Adjust the limit as needed
        onSuccess: (newQuotes) {
          quotes.addAll(newQuotes);
          currentPage++;
          update();
        },
        onError: (error) {
          // Handle error
          CustomSnackBar.error(
              title: "Quotes", message: "Failed to Fetch Quotes");
        },
      );
    } catch (e) {
      // Handle error
    }
  }

  // Example method to fetch a quote from an API
//  Future<void> fetchQuote() async {
//     // Replace this URL with your actual API endpoint
//     final response = await http.get(Uri.parse('https://api.example.com/quote'));

//     if (response.statusCode == 200) {
//       // If the server returns a 200 OK response, parse the JSON.
//       final quote = Quote.fromJson(jsonDecode(response.body));
//       updateQuote(quote);
//     } else {
//       // If the server returns an error response, throw an exception.
//       throw Exception('Failed to load quote');
//     }
//  }
}
