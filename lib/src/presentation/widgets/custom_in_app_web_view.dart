import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CustomInAppWebView extends StatefulWidget {
  final String idYoutube;
  const CustomInAppWebView({
    Key? key,
    required this.idYoutube,
  }) : super(key: key);

  @override
  _CustomInAppWebViewState createState() => _CustomInAppWebViewState();
}

class _CustomInAppWebViewState extends State<CustomInAppWebView> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
      displayZoomControls: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
      allowsAirPlayForMediaPlayback: false,
    ),
  );

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: webViewKey,
      initialUrlRequest: URLRequest(
        url: Uri.parse(
          "https://www.youtube.com/embed/${widget.idYoutube}?fs=1",
        ),
      ),
      initialOptions: options,
      onWebViewCreated: (controller) {
        webViewController = controller;
      },
      onLoadStart: (InAppWebViewController controller, Uri? url) {},
      onLoadStop: (InAppWebViewController controller, Uri? url) {},
      onEnterFullscreen: (InAppWebViewController controller) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      },
      onExitFullscreen: (InAppWebViewController controller) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      },
    );
  }
}
