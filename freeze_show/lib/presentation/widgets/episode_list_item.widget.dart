import 'package:flutter/material.dart';
import 'package:freeze_show/domain/entities/show_episode.entity.dart';

class EpisodeListItem extends StatelessWidget {
  final int index;
  final ShowEpisodeItem episode;

  const EpisodeListItem(
    this.index,
    this.episode, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      child: ListTile(
        tileColor: Colors.transparent,
        leading: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: Image.network(
            episode.image?.medium ?? (episode.show.image?.medium ?? ""),
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Image(
                image: AssetImage('assets/film-poster-placeholder1.png'),
              );
            },
          ),
        ),
        title: Text(
          episode.name == "" ? episode.show.name : episode.name,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Column(
          children: [
            Subtitle(
              title: "Season",
              text: episode.season.toString(),
            ),
            Subtitle(
              title: "Number",
              text: episode.number.toString(),
            ),
          ],
        ),
        trailing: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}

class Subtitle extends StatelessWidget {
  final String title;
  final String text;

  const Subtitle({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 16,
                    color: Colors.white60,
                  ),
            ),
            const TextSpan(text: ": "),
            TextSpan(
              text: text,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
