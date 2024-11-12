import 'package:flutter/material.dart';
import 'package:freeze_show/domain/entities/show_item.entity.dart';

class ShowListItem extends StatelessWidget {
  final int index;
  final ShowItem show;

  const ShowListItem(
    this.index,
    this.show, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        constraints: const BoxConstraints(
          maxHeight: 220,
          maxWidth: 80,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(35),
          ),
          child: show.image?.medium != null
              ? Image.network(
                  show.image?.medium ?? "",
                  fit: BoxFit.contain,
                  height: 300,
                  errorBuilder: (context, error, stackTrace) {
                    return const Image(
                      image: AssetImage('assets/film-poster-placeholder1.png'),
                    );
                  },
                )
              : const Image(
                  image: AssetImage('assets/film-poster-placeholder1.png'),
                ),
        ),
      ),
      title: Text(
        show.name,
        textAlign: TextAlign.start,
      ),
      subtitle: show.genres != []
          ? Builder(
              builder: (context) {
                final List<Widget> showsGenres = [];
                show.genres?.forEach((element) {
                  showsGenres.add(
                    Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.only(right: 8, top: 5),
                      decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                      child: Text(
                        element,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                });
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...showsGenres,
                    ],
                  ),
                );
              },
            )
          : Container(),
      trailing: const Icon(Icons.play_arrow_rounded),
    );
  }
}
