import 'package:flutter/material.dart';
import 'package:waffarha_challenge/features/album/widgets/sort_by_widget.dart';

import '../album_controller.dart';

/// A widget that provides sorting options for albums.
///
/// The `SortOptionsRow` widget displays a row of toggle buttons that allow
/// users to sort albums by different criteria, such as album ID or photo title.
/// The sorting options are represented by [SortByWidget] instances.
///
/// The widget requires an [AlbumController] to manage the current sort states
/// and handle sorting actions.
class SortOptionsRow extends StatelessWidget {
  const SortOptionsRow({
    super.key,
    required this.controller,
  });

  final AlbumController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SortByWidget(
          initialLabelIndex: controller.albumIdSort.value,
          txt: 'sort by album id',
          onToggle: (int? index) {
            controller.updateAlbumIdSort(index);
          },
        ),
        SortByWidget(
          initialLabelIndex: controller.titleSort.value,
          txt: 'sort by photo title',
          onToggle: (int? index) {
            controller.updateTitleSort(index);
          },
        )
      ],
    );
  }
}
