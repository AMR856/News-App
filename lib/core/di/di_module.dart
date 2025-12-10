import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String _getEnvVariable(String key) {
  return dotenv.env[key]!;
}

@module
abstract class AppModule {
  @Named('baseUrl')
  String get baseUrl => _getEnvVariable('BASE_URL');

  @Named('apiKey')
  String get apiKey => _getEnvVariable('API_KEY');

  @lazySingleton
  Dio dio() {
    final baseUri = _getEnvVariable('BASE_URL');
    return Dio(
      BaseOptions(
        baseUrl: baseUri,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
  }
}
