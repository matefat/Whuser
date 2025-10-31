import 'package:dio/dio.dart';

class RemoteUserDataSource {
  final Dio dio;

  RemoteUserDataSource({Dio? dio})
      : dio = dio ??
      Dio(
        BaseOptions(
          baseUrl: 'https://randomuser.me/api/',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

  Future<Map<String, dynamic>> fetch() async {
    try {
      final resp = await dio.get('/');
      if (resp.statusCode != 200) {
        throw Exception('Falha ao buscar usuário: HTTP Erro ${resp.statusCode}');
      }
      final data = resp.data as Map<String, dynamic>;
      final results = (data['results'] as List).cast<Map<String, dynamic>>();
      return results.first;
    } on DioException catch (e) {
      final code = e.response?.statusCode;
      final reason = e.message ?? 'Erro de rede';
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Tempo de conexão esgotado.');
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Tempo de resposta esgotado.');
      }
      if (e.type == DioExceptionType.badResponse) {
        throw Exception('Erro do servidor (HTTP $code).');
      }
      if (e.type == DioExceptionType.connectionError) {
        throw Exception('Sem conexão com a internet.');
      }
      throw Exception('Falha ao buscar usuário: $reason');
    } catch (e) {
      throw Exception('Erro inesperado ao buscar usuário.');
    }
  }
}
