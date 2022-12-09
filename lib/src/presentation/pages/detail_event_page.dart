import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ta_bsi/src/data/models/event_model.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_button.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_app_bar.dart';
import 'package:ta_bsi/src/utils/route/go.dart';
import 'package:ta_bsi/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailEventPage extends StatelessWidget {
  const DetailEventPage(this.event, {Key? key}) : super(key: key);

  final Object? event;

  @override
  Widget build(BuildContext context) {
    EventModel _event = event as EventModel;

    void onTap(String url) async {
      if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
    }

    void onTapAppBar() {
      Go.back(context);
    }

    Widget eventImage() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(defaultBorderRadius),
        child: Image.asset(_event.fullImageUrl),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
        ),
        child: Html(
          data: _event.fullDescription,
          style: {
            'div': Style(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
            ),
            'p': Style(
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.all(0),
              textAlign: TextAlign.justify,
              lineHeight: const LineHeight(
                1.8,
              ),
            ),
          },
        ),
      );
    }

    Widget buttonRegistEvent() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CustomButton(
            title: 'Daftar Event',
            backgroundColor: primaryColor,
            borderRadius: 50,
            onPressed: () => onTap(_event.linkRegister),
            textStyle: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    Widget body() {
      return SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                CustomAppBar(title: 'Event', onTap: onTapAppBar),
                Container(
                  margin: EdgeInsets.only(
                    top: defaultMargin,
                    left: defaultMargin,
                    right: defaultMargin,
                    bottom: defaultMargin * 4,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                  child: Column(
                    children: [
                      eventImage(),
                      description(),
                    ],
                  ),
                ),
              ],
            ),
            buttonRegistEvent(),
          ],
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
