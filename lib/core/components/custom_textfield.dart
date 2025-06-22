import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:veritey/core/constants/app_colors.dart';

class CustomGooglePlaceField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onLocationSelected;
  final String apiKey;

  const CustomGooglePlaceField({
    required this.controller,
    required this.onLocationSelected,
    required this.apiKey,
    super.key,
  });

  @override
  State<CustomGooglePlaceField> createState() => _CustomGooglePlaceFieldState();
}

class _CustomGooglePlaceFieldState extends State<CustomGooglePlaceField> {
  List<dynamic> _suggestions = [];
  Timer? _debounce;

  void _onChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (value.isNotEmpty) _fetchSuggestions(value);
    });
  }

  Future<void> _fetchSuggestions(String input) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=${widget.apiKey}&components=country:pk';

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    if (mounted && data['status'] == 'OK') {
      setState(() => _suggestions = data['predictions']);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: widget.controller,
          onChanged: (value) {
            _onChanged(value);
            setState(() {});
          },
          decoration: InputDecoration(
            hintText: 'Enter the Location',
            prefixIcon:
                const Icon(Icons.place_outlined, color: AppColors.primary),
            suffixIcon: widget.controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      widget.controller.clear();
                      setState(() => _suggestions = []);
                    },
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
        if (_suggestions.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(blurRadius: 5, color: AppColors.fieldColor)
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                final item = _suggestions[index];
                return ListTile(
                  title: Text(item['description']),
                  onTap: () {
                    widget.controller.text = item['description'];
                    widget.onLocationSelected(item['description']);
                    setState(() => _suggestions = []);
                  },
                );
              },
            ),
          ),
      ],
    );
  }
}
