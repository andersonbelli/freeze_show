import 'package:flutter/material.dart';

class ShowDetailsItem extends StatelessWidget {
  final String? title;
  final Widget body;

  const ShowDetailsItem({
    Key? key,
    required this.body,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 30,
        right: 15,
        bottom: 30,
      ),
      child: Column(
        children: [
          if (title != null)
            SizedBox(
              width: double.maxFinite,
              child: Text(
                title ?? "",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          else
            const SizedBox(),
          SizedBox(
            width: double.maxFinite,
            child: body,
          ),
        ],
      ),
    );
  }
}
