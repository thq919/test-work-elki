import 'package:dio/dio.dart';

class ClientService {
  static final ClientService _clientService = ClientService._internal();
  ClientService._internal();
  factory ClientService() => _clientService;
  final Dio _dio = Dio();
  get dio => _dio;
}
