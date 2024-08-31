import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A text field widget designed for searching by album ID.
///
/// The `SearchTextField` widget provides a text input field for users to search
/// by album ID. It includes search and clear buttons within the suffix of the
/// text field. The search button triggers a search action, and the clear button
/// clears the text field.
///
/// The widget takes the following parameters:
/// - [albumIdController]: A [TextEditingController] to manage the text input.
/// - [onPressed]: A callback function that is called when the search button is pressed.
/// - [onClearPressed]: A callback function that is called when the clear button is pressed.

class SearchTextField extends StatelessWidget {
  final TextEditingController albumIdController;
  final VoidCallback onPressed;
  final VoidCallback onClearPressed;

  const SearchTextField({
    super.key,
    required this.onPressed,
    required this.onClearPressed,
    required this.albumIdController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: TextFormField(
        controller: albumIdController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          hintText: 'Search by album id',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded border
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Colors.purple),
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min, // Adjusts row to fit its content
            children: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.purpleAccent,
                ),
                onPressed: onPressed,
              ),
              IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.redAccent,
                ),
                onPressed: onClearPressed,
              ),
            ],
          ),
        ),
        onEditingComplete: onPressed,
      ),
    );
  }
}
