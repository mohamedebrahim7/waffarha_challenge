import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

/// A widget that provides a toggle switch for sorting.
///
/// The `SortByWidget` widget consists of a label and a toggle switch that allows
/// the user to choose between two sorting options. The label text indicates the
/// sort criterion (e.g., 'sort by album id'), and the toggle switch lets the user
/// toggle between ascending and descending sorting orders.
///
/// The widget requires a [String] for the label text, a callback function [OnToggle]
/// to handle toggle actions, and an optional [initialLabelIndex] to set the
/// initial toggle state.
///
class SortByWidget extends StatelessWidget {
  final String txt;
  final OnToggle onToggle;
  final int? initialLabelIndex;

  const SortByWidget({
    super.key,
    required this.txt,
    required this.onToggle,
    this.initialLabelIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          txt,
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 5.0),
        ToggleSwitch(
          doubleTapDisable: true,
          minWidth: 50,
          initialLabelIndex: initialLabelIndex,
          totalSwitches: 2,
          icons: const [
            CupertinoIcons.arrow_up_right,
            CupertinoIcons.arrow_down_left,
          ],
          activeBgColors: const [
            [Colors.purple],
            [Colors.pink],
          ],
          onToggle: onToggle,
        ),
      ],
    );
  }
}
