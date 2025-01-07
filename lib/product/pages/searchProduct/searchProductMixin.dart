

import 'dart:convert';

/*
mixin searchProductViewMixin{

  Future<void> _fetchProducts(String query) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Replace with your server's URL
      final url = Uri.parse('https://yourserver.com/api/products');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'query': query}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _products = List<Map<String, dynamic>>.from(data['products']);
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      setState(() {
        _error = "An error occurred while fetching products. Please try again.";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

 */