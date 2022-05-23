import 'package:flutter/material.dart';
import 'package:ta_bsi/src/presentation/widgets/custom_button.dart';

class TestListview extends StatefulWidget {
  const TestListview({Key? key}) : super(key: key);

  @override
  State<TestListview> createState() => _TestListviewState();
}

class _TestListviewState extends State<TestListview> {
  late ScrollController _scrollController;

  int index = 0;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    // _scrollController..addListener(() {_scrollController})
  }

  void button() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_scrollController.hasClients) {
      print('scroll contreo ${_scrollController.position.maxScrollExtent}');
    }
    print(_scrollController.hasClients);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              controller: _scrollController,
              itemBuilder: (BuildContext context, int i) {
                WidgetsBinding.instance!.addPostFrameCallback((_) => {
                      _scrollController
                          .jumpTo(_scrollController.position.maxScrollExtent)
                    });

                return index >= i
                    ? Container(
                        width: 200,
                        height: 200,
                        margin: EdgeInsets.only(bottom: 20),
                        color: Colors.blue,
                        child: Text(i.toString()),
                      )
                    : Container();
              },
            ),
          ),
          CustomButton(
            title: 'increment',
            onPressed: () {
              button();
            },
          ),
        ],
      ),
    );
  }
}
