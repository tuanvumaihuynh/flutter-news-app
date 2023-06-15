import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkService {
  NetworkService();

  static const Duration checkInterval = Duration(seconds: 2);

  final _connectionChecker =
      InternetConnectionChecker.createInstance(checkInterval: checkInterval);

  Future<bool> get isConnected => _connectionChecker.hasConnection;

  Stream<InternetConnectionStatus> get connectionStream =>
      _connectionChecker.onStatusChange;
}
