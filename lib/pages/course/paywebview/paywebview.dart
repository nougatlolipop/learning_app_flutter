import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/widgets/base_text_widget.dart';
import 'package:learning_app/pages/course/paywebview/bloc/payview_bloc.dart';
import 'package:learning_app/pages/course/paywebview/bloc/payview_event.dart';
import 'package:learning_app/pages/course/paywebview/bloc/payview_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayWebView extends StatefulWidget {
  const PayWebView({super.key});

  @override
  State<PayWebView> createState() => _PayWebViewState();
}

class _PayWebViewState extends State<PayWebView> {
  late final WebViewController webViewController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    context.read<PayWebViewBloc>().add(TriggerWebView(args['url']));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayWebViewBloc, PayWebViewState>(
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBar("Payment"),
          body: state.url == ""
              ? const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                )
              : WebViewWidget(
                  controller: WebViewController()
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..addJavaScriptChannel(
                      'Pay',
                      onMessageReceived: (JavaScriptMessage message) {
                        print(message.message);
                        Navigator.of(context).pop(message.message);
                      },
                    )
                    ..loadRequest(
                      Uri.parse(state.url),
                    ),
                ),
        );
      },
    );
  }
}
