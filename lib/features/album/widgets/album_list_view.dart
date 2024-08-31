import 'package:api_client/api_client.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// A widget that displays a list of albums using a ListView.
///
/// The `AlbumListView` widget takes a list of [Album] objects and displays
/// them in a scrollable list format. Each album is represented by a [ListTile]
/// that shows the album's thumbnail, title, and album ID.
///
/// The widget requires a [List] of [Album] objects to be passed as a parameter.
class AlbumListView extends StatelessWidget {
  final List<Album> albums;

  const AlbumListView({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];
        int retryCount = 0;

        return ListTile(
          leading: StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return CachedNetworkImage(
                key: ValueKey(retryCount), // Force widget rebuild on retry
                imageUrl: album.thumbnailUrl,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => IconButton(
                    onPressed: () {
                      setState(() {
                        retryCount++;
                      });
                    },
                    icon: const Icon(Icons.refresh)),
              );
            },
          ),
          title: Text(album.title),
          subtitle: Text('Album ID: ${album.albumId}'),
        );
      },
    );
  }
}
