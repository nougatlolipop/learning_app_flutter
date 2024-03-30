class PayWebViewState {
  final String url;

  const PayWebViewState({this.url = ""});

  PayWebViewState copyWith({String? url}) {
    return PayWebViewState(url: url ?? this.url);
  }
}
