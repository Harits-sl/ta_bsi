import 'package:flutter/material.dart';
import 'package:ta_bsi/src/data/models/event_model.dart';
import 'package:ta_bsi/theme.dart';

class CardEvent extends StatelessWidget {
  const CardEvent({
    Key? key,
    required this.event,
  }) : super(key: key);

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        left: defaultMargin,
        right: defaultMargin,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(0, 1),
            color: grayColor,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              event.imageUrl,
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 20,
              left: 10,
              right: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  event.description,
                  style: blackTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
