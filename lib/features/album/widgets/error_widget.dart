import 'package:flutter/material.dart';

/// A widget that displays an error message when an error occurs.
///
/// The `ErrorWidget` is used to indicate an error state in the application.
/// It typically displays an icon and a text message to inform the user that
/// an error has occurred. This widget is useful for showing network errors,
/// data fetching issues, or any other unexpected problems.

class NetworkErrorView extends StatelessWidget {
  final VoidCallback onPressed;

  const NetworkErrorView({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 80, // Size of the error icon
          ),
          const SizedBox(height: 20),
          const Text(
            'Network Error', // Static text indicating a network error
            style: TextStyle(
              fontSize: 18, // Font size for the text
              fontWeight: FontWeight.bold, // Font weight for emphasis
            ),
          ),
          const SizedBox(height: 10),

          const Text(
            'Failed to load albums.', // Static text indicating a network error
            style: TextStyle(
              fontSize: 18, // Font size for the text
              fontWeight: FontWeight.bold, // Font weight for emphasis
            ),
          ),
          const SizedBox(
              height: 30), // Space between the message and the button
          OutlinedButton(
            onPressed: onPressed,
            // Button text
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
              minimumSize: const Size(250, 50), // Text style for button text
            ), // Callback for the reload button
            child: const Text(
              style: TextStyle(color: Colors.black),
              'Reload',
            ),
          ),
        ],
      ),
    );
  }
}
