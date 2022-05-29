import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ta_bsi/src/presentation/cubit/event/event_cubit.dart';
import 'package:ta_bsi/src/presentation/widgets/card_event.dart';
import 'package:ta_bsi/theme.dart';

import '../../utils/route/go.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  void initState() {
    super.initState();

    context.read<EventCubit>().fetchListEvent();
  }

  @override
  Widget build(BuildContext context) {
    void onTap(String id) {
      Go.routeWithPath(
        context: context,
        path: '/detail-event',
        arguments: {
          'id': id,
        },
      );
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upcoming event',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Ikuti event sesuai minat anda',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: light,
              ),
            ),
          ],
        ),
      );
    }

    Widget listEvent() {
      int _index = 0;

      return BlocBuilder<EventCubit, EventState>(
        builder: (context, state) {
          if (state is EventLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is EventSuccess) {
            return Column(
              children: state.event.map((event) {
                _index++;
                return Container(
                  margin: EdgeInsets.only(
                    top: _index == 1 ? 20 : 15,
                    bottom:
                        _index == state.event.length ? (55 + defaultMargin) : 0,
                  ),
                  child: GestureDetector(
                    onTap: () => onTap(event.id),
                    child: CardEvent(
                      event: event,
                    ),
                  ),
                );
              }).toList(),
            );
          }
          return const SizedBox();
        },
      );
    }

    Widget body() {
      return SafeArea(
        child: ListView(
          children: [
            header(),
            listEvent(),
          ],
        ),
      );
    }

    return Scaffold(
      body: body(),
    );
  }
}
