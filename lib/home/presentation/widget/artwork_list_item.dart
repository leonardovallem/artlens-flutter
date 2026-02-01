import 'package:artlens/shared/domain/model/Artwork.dart';
import 'package:artlens/shared/presentation/widget/category_chip.dart';
import 'package:flutter/material.dart';

import '../../../shared/util/extensions/string.dart';

class ArtworkListItem extends StatelessWidget {
  final Artwork _artwork;
  final GestureTapCallback onTap;

  const ArtworkListItem({
    super.key,
    required Artwork artwork,
    required this.onTap,
  }) : _artwork = artwork;

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(_artwork.title, style: Theme.of(context).textTheme.titleLarge),
    subtitle: Column(
      spacing: 8,
      crossAxisAlignment: .start,
      children: [
        Padding(padding: .only(top: 8)),
        if (_artwork.description != null)
          Text(_artwork.description!.stripHtmlTags(), overflow: .ellipsis),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ..._artwork.categories.map(
              (category) => CategoryChip(category: category),
            ),
          ],
        ),
      ],
    ),
    onTap: onTap,
  );
}


