import 'package:flutter/material.dart';
import 'package:ta_bsi/src/data/models/youtube_model.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';

class CardYoutube extends StatelessWidget {
  const CardYoutube({
    Key? key,
    required this.youtube,
  }) : super(key: key);

  final YoutubeModel youtube;

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Go.routeWithPath(
        context: context,
        path: '/youtube',
        arguments: {
          'id': youtube.idYoutube,
        },
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 180,
        decoration: BoxDecoration(
          border: Border.all(color: grayColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                youtube.imageUrl,
                height: 125,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 10,
              ),
              child: Text(
                youtube.title,
                style: blackTextStyle.copyWith(
                  fontSize: 11,
                  fontWeight: semiBold,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
