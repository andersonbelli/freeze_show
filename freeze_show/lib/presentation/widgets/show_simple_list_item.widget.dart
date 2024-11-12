import 'package:flutter/material.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';

class ShowSimpleListItem extends StatelessWidget {
  final int index;
  final ShowItem show;

  const ShowSimpleListItem(
    this.index,
    this.show, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 6,
        right: 6,
        top: 7,
      ),
      padding: const EdgeInsets.only(
        top: 10,
        left: 6,
        right: 6,
        bottom: 10,
      ),
      child: Column(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(35),
              ),
              child: show.image?.medium != null
                  ? Image.network(
                      show.image?.medium ?? "",
                      fit: BoxFit.fill,
                      height: 300,
                      errorBuilder: (context, error, stackTrace) {
                        return const Image(
                          image: AssetImage(
                            'assets/film-poster-placeholder1.png',
                          ),
                        );
                      },
                    )
                  : const Image(
                      image: AssetImage('assets/film-poster-placeholder1.png'),
                    ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              show.name,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
