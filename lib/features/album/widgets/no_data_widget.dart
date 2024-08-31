import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A widget that displays a message when there is no data to show.
///
/// The `NoDataWidget` is used to indicate that no data is available to display.
/// It consists of an icon and a text message, both centered on the screen.
/// This widget is typically used when data fetching results in no data or an empty state.
class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.folderOpen,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Nothing to show here.', // Message indicating no data
              style: TextStyle(
                fontSize: 18, // Font size for the text
                fontWeight: FontWeight.bold, // Font weight for emphasis
              ),
            ),
          ],
        ),
      ),
    );
  }
}
