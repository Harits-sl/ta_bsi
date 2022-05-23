import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
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
    // tampilan portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      key: webViewKey,
      initialUrlRequest: URLRequest(
        url: Uri.parse(
          "https://www.youtube.com/embed/${widget.idYoutube}?&autoplay=1&fs=1",
        ),
      ),
      initialOptions: options,
      onWebViewCreated: (controller) {
        webViewController = controller;

        // fullscreen landscape
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      },
      onLoadStart: (InAppWebViewController controller, Uri? url) {},
      onLoadStop: (InAppWebViewController controller, Uri? url) {},
      onEnterFullscreen: (InAppWebViewController controller) {
        // fullscreen landscape
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
      },
      onExitFullscreen: (InAppWebViewController controller) {
        SystemChrome.setPreferredOrientations([
          // tampilan portrait
          DeviceOrientation.portraitUp,
        ]);
      },
    );

    // return Html(data: """
    //   <iframe src="https://www.youtube.com/embed/${widget.idYoutube}?&autoplay=1&fs=1"></iframe>
    // """);
  }
}
