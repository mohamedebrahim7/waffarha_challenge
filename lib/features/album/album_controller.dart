import 'dart:developer';

import 'package:api_client/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

/// Enum representing the state of data fetching operations.
enum DataState { loading, failure, success }

/// Controller for managing album data, including fetching, sorting, and pagination.
///
/// This controller handles the state and actions related to displaying albums,
/// including sorting, pagination, and filter management. It uses GetX for state
/// management and reactive programming.
///
/// **Dependencies:**
/// - `apiClient`: An instance of `ApiClient` used to fetch album data.
/// - `TextEditingController` for managing the album ID filter input.
class AlbumController extends GetxController {
  // MARK: - Reactive State Variables
  /// The current state of data fetching: loading, failure, or success.
  var dataState = DataState.loading.obs;

  /// List of fetched albums.
  var albums = <Album>[];

  // MARK: - Pagination Variables
  /// The current page number being viewed.
  var currentPage = 1.obs;

  /// The number of albums per page.
  final int limit = 10;

  /// Indicates if there are more pages to fetch.
  var hasMorePages = true;

  // MARK: - Sorting Variables
  /// Sort order for album ID. Null means no sort, 0 for ascending, 1 for descending.
  RxnInt albumIdSort = RxnInt();

  /// Sort order for title. Null means no sort, 0 for ascending, 1 for descending.
  RxnInt titleSort = RxnInt();

  // MARK: - Filter Variable
  /// Controller for managing the album ID filter input.
  final TextEditingController albumIdFilter = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAlbums();
  }

  @override
  void onClose() {
    albumIdFilter.dispose();
    super.onClose();
  }

  // MARK: - Data Fetching

  /// Fetches a list of albums from the API.
  ///
  /// Handles fetching data for the current page and applying sorting and filtering
  /// based on user preferences. Updates the state to indicate loading, success,
  /// or failure. Prevents fetching if no more pages are available.
  ///
  /// [isFetchingNextPage] indicates whether the fetch is for the next page
  /// or a fresh fetch. Resets `hasMorePages` if fetching from the first page again.
  Future<void> fetchAlbums({bool isFetchingNextPage = true}) async {
    if (isFetchingNextPage && !hasMorePages) {
      return; // Do nothing if trying to fetch next page when there are no more pages
    } else if (!isFetchingNextPage && !hasMorePages) {
      hasMorePages =
          true; // Reset hasMorePages if fetching from the first page again
    }

    try {
      dataState.value = DataState.loading;

      // Determine the sort field and order based on current preferences
      String? sortField =
          determineSortField(albumIdSort.value, titleSort.value);
      String? sortOrder =
          determineSortOrder(albumIdSort.value, titleSort.value);

      final fetchedAlbums = await apiClient.getAlbumsPage(
        limit,
        currentPage.value,
        sortField,
        sortOrder,
        int.tryParse(albumIdFilter.text),
      );

      // Update the albums list with the fetched data
      albums.assignAll(fetchedAlbums);

      dataState.value = DataState.success;

      // Check if the fetched data is smaller than the limit
      if (fetchedAlbums.length < limit) {
        hasMorePages = false; // No more pages to fetch
      }
    } catch (e) {
      dataState.value = DataState.failure;
      log("Error fetching albums: $e");
    }
  }

  // MARK: - Sorting Management

  /// Updates the sorting order by album ID and triggers a refresh of the album list.
  ///
  /// [sortOrder] is the desired sort order: 0 for ascending, 1 for descending.
  void updateAlbumIdSort(int? sortOrder) {
    albumIdSort.value = sortOrder;
    refreshAlbums(); // Fetch new data with updated sort
  }

  /// Updates the sorting order by title and triggers a refresh of the album list.
  ///
  /// [sortOrder] is the desired sort order: 0 for ascending, 1 for descending.
  void updateTitleSort(int? sortOrder) {
    titleSort.value = sortOrder;
    refreshAlbums(); // Fetch new data with updated sort
  }

  // MARK: - Sorting Utilities

  /// Determines the sort field based on current sort preferences.
  ///
  /// Returns 'albumId', 'title', or 'albumId,title' based on sorting preferences.
  String? determineSortField(int? albumIdSort, int? titleSort) {
    if (albumIdSort != null && titleSort == null) {
      return 'albumId';
    } else if (titleSort != null && albumIdSort == null) {
      return 'title';
    } else if (albumIdSort != null && titleSort != null) {
      return 'albumId,title';
    } else {
      return null;
    }
  }

  /// Determines the sort order based on current sort preferences.
  ///
  /// Returns 'asc', 'desc', or a combination like 'asc,desc' based on sorting preferences.
  String? determineSortOrder(int? albumIdSort, int? titleSort) {
    if (albumIdSort != null && titleSort == null) {
      return albumIdSort == 0 ? 'asc' : 'desc';
    } else if (titleSort != null && albumIdSort == null) {
      return titleSort == 0 ? 'asc' : 'desc';
    } else if (albumIdSort != null && titleSort != null) {
      String albumOrder = albumIdSort == 0 ? 'asc' : 'desc';
      String titleOrder = titleSort == 0 ? 'asc' : 'desc';
      return '$albumOrder,$titleOrder';
    } else {
      return null;
    }
  }

  // MARK: - Filter Management

  /// Clears the album ID filter and refreshes the album list.
  void clearFilter() {
    albumIdFilter.clear();
    refreshAlbums();
  }

  // MARK: - Pagination Management

  /// Refreshes the album list by resetting the current page and fetching the data.
  void refreshAlbums() {
    currentPage.value = 1;
    fetchAlbums(isFetchingNextPage: false);
  }

  /// Checks if the current page is the first page.
  ///
  /// Returns `true` if the current page is 1, otherwise `false`.
  bool isFirstPage() => currentPage.value == 1;

  /// Checks if the current page is the last page.
  ///
  /// Returns `true` if there are no more pages to fetch, otherwise `false`.
  bool isLastPage() => !hasMorePages;

  /// Increments the current page and fetches the next page of albums.
  void incrementPage() {
    currentPage.value++;
    fetchAlbums(isFetchingNextPage: true);
  }

  /// Decrements the current page and fetches the previous page of albums.
  void decrementPage() {
    currentPage.value--;
    fetchAlbums(isFetchingNextPage: false);
  }
}
