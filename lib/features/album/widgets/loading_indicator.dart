import 'package:flutter/material.dart';

/// A widget that displays a loading indicator.
///
/// The `LoadingIndicator` widget is used to show a circular progress
/// indicator in the center of the screen. It is typically used when
/// data is being loaded or a process is ongoing, indicating to the
/// user that they should wait.

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
