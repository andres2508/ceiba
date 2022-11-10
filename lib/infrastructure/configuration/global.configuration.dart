class GlobalCeibaConfiguration {
  String _ceibaServer = 'https://jsonplaceholder.typicode.com';

  static final GlobalCeibaConfiguration controller =
      GlobalCeibaConfiguration._intern();

  GlobalCeibaConfiguration._intern();

  factory GlobalCeibaConfiguration() {
    return controller;
  }

  get ceibaServer => this._ceibaServer;
}