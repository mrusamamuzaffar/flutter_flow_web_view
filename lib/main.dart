import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePageWidget(),
  ));
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  void initState() {
    WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: Theme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  child: const Text('Get'),
                  // text: 'Button',
                  /*options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),*/
                ),
                const Text(
                  'Flutter Flow and WebView ',
                  // style: FlutterFlowTheme.of(context).bodyText1,
                ),
                Expanded(
                  // child: SizedBox(),
                  child: WebView(
                    initialUrl: 'https://evoondemand.bubbleapps.io/app_mobile?tab=tela%20inicial',
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                    /*bypass: false,
                    height: MediaQuery.of(context).size.height * 1,
                    verticalScroll: false,
                    horizontalScroll: false,*/
                  ),
                  /*child: FlutterFlowWebView(
                    url:
                    'https://evoondemand.bubbleapps.io/app_mobile?tab=tela%20inicial',
                    bypass: false,
                    height: MediaQuery.of(context).size.height * 1,
                    verticalScroll: false,
                    horizontalScroll: false,
                  ),*/
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
