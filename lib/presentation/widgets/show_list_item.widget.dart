import 'package:flutter/material.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';

class ShowListItem extends StatelessWidget {
  final int index;
  final ShowItem show;

  const ShowListItem(this.index, this.show, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: ClipRRect(
            borderRadius: index % 2 != 0
                ? const BorderRadius.only(
                    topLeft: Radius.circular(55),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(55),
                    bottomRight: Radius.circular(5),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(55),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(55),
                  ),
            child: Image.network(
              show.image.medium,
              fit: BoxFit.fill,
              height: 300,
              errorBuilder: (context, error, stackTrace) {
                return const Image(
                  image: AssetImage('assets/film-poster-placeholder1.png'),
                );
              },
            ),
          ),
        ),
        ListTile(
          title: Text(
            show.name,
            textAlign: TextAlign.center,
          ),
          onTap: () {},
        ),
      ],
    );
  }
}
