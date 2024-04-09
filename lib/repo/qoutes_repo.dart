import 'dart:convert';
import 'dart:developer';
import 'package:fyp/model/quotes.dart';
import 'package:fyp/utils/apis.dart';
import 'package:http/http.dart' as http;

class QuotesRepo {
  Future<void> getQuotes({
    required int page,
    required int limit,
    required Function(List<Quote> quotes) onSuccess,
    required Function(String? error) onError,
  }) async {
    try {
      var headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };
      // Append pagination parameters to the URL
      String url = '${Apis.GETQOUTES}?page=$page&limit=$limit';
      log(url.toString());
      http.Response response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      dynamic data = json.decode(response.body);
      log(data.toString());
      // if (response.statusCode == 200 && response.statusCode < 300) {
      if (data["message"] == "Motivations fetched successfully") {
        List<Quote> quotes = (data["Motivations"] as List)
            .map((item) => Quote.fromJson(item))
            .toList();
        onSuccess(quotes);
      } else {
        onError(data['message']);
      }
    } catch (e) {
      log(e.toString());
      onError("Something went wrong");
    }
  }
}
