import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:waffarha_challenge/features/album/widgets/album_feature_widgets.dart';

import 'album_controller.dart';

/// `AlbumScreen` displays a list of albums with sorting, filtering, and pagination options.
///
/// This screen uses the `AlbumController` to manage state and data fetching. It handles various states of data fetching:
/// - **Loading**: Displays a `LoadingIndicator` while data is being fetched.
/// - **Error**: Shows an `ErrorWidget` if there is a failure during data retrieval.
/// - **Success**: Renders the album data along with options for sorting, filtering, and pagination.
///
/// Key Design Considerations:
/// - **Unified User Experience**: The entire screen reacts to the data state, ensuring a clear and cohesive user experience.
/// - **Functional UI Elements**: Sorting, pagination, and filtering options are only displayed when data is successfully fetched.
/// - **Focus on Code Quality**: Prioritizes functionality and clarity over additional features like responsive design.
///
/// The `AlbumScreen` integrates several widgets:
/// - `SearchTextField` for filtering albums by ID.
/// - `SortOptionsRow` for sorting options by album ID and title.
/// - `PaginationControls` for navigating through album pages.
/// - `AlbumListView` to display the list of albums.
/// - `NoDataWidget` for displaying a message when there are no albums.
///
/// This design approach simplifies state management and maintains a clean user interface.

class AlbumScreen extends StatelessWidget {
  final AlbumController controller = Get.put(AlbumController());

  AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Viewer'),
      ),
      body: Obx(() {
        switch (controller.dataState.value) {
          case DataState.loading:
            return const LoadingIndicator();
          case DataState.failure:
            return NetworkErrorView(
              onPressed: () {
                controller.fetchAlbums();
              },
            );
          case DataState.success:
            var isAlbumEmpty = controller.albums.isEmpty;
            return Column(
              children: [
                SearchTextField(
                  onPressed: () {
                    controller
                        .refreshAlbums(); // Fetch new data with updated sort
                  },
                  onClearPressed: () {
                    controller.clearFilter();
                  },
                  albumIdController: controller.albumIdFilter,
                ),
                isAlbumEmpty
                    ? const SizedBox()
                    : SortOptionsRow(controller: controller),
                PaginationControls(controller: controller),
                !isAlbumEmpty ? const SizedBox() : const NoDataWidget(),
                isAlbumEmpty
                    ? const SizedBox()
                    : Expanded(
                        child: AlbumListView(
                          albums: controller.albums,
                        ),
                      ),
              ],
            );
          default:
            return const Center(
                child: Text(' Unknown state')); // Add this line,
        }
      }),
    );
  }
}
