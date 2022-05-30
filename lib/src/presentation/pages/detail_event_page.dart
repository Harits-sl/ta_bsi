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
      if (!await launch(url)) throw 'Could not launch $url';
    }

    void onTapAppBar() {
      Go.back(context);
    }

    Widget eventImage() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Image.asset(_event.fullImageUrl),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Html(data: _event.fullDescription),
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
            onPressed: () => onTap('https://${_event.linkRegister}'),
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
                eventImage(),
                description(),
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
