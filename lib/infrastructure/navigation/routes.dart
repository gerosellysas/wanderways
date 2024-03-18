class Routes {
  static Future<String> get initialRoute async {
    return splash;
  }

  static const home = '/home';
  static const splash = '/';
  static const welcome = '/welcome';
  static const signIn = '/sign_in';
}
