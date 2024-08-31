import 'package:flutter/material.dart';

import '../album_controller.dart';

/// A widget that provides pagination controls for navigating through pages.
///
/// The `PaginationControls` widget displays left and right arrow buttons
/// to navigate between pages. The left arrow button is disabled when
/// the current page is the first page, and the right arrow button is
/// disabled when the current page is the last page.
///
/// The widget requires an [AlbumController] to manage the current page state
/// and handle page navigation actions.
class PaginationControls extends StatelessWidget {
  const PaginationControls({
    super.key,
    required this.controller,
  });

  final AlbumController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: controller.isFirstPage()
              ? null
              : () => controller.decrementPage(),
        ),
        const SizedBox(width: 16.0),
        Text(
          'Page ${controller.currentPage.value}',
          style: const TextStyle(fontSize: 18.0),
        ),
        const SizedBox(width: 16.0),
        IconButton(
          icon: const Icon(Icons.arrow_right),
          onPressed:
              controller.isLastPage() ? null : () => controller.incrementPage(),
        ),
      ],
    );
  }
}
