import 'package:dio/dio.dart';

class ApiClient {
  // Singleton pattern for efficiency
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  
  late Dio _dio;

  ApiClient._internal() {
    _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      // If using an API Gateway, use one base URL. 
      // If direct microservices, you might override this per request.
      baseUrl: 'https://api.krushikranti.com/v1', 
      headers: {'Content-Type': 'application/json'},
    ));
    
    // Add interceptors for Auth Tokens (crucial for role-based login later)
    _dio.interceptors.add(LogInterceptor(responseBody: true)); // For debugging
  }

  Dio get client => _dio;
  
  // Helper for specific microservices if NO gateway exists
  Future<Response> get(String microservice, String endpoint) {
    // e.g., microservice = '/expert-service'
    return _dio.get('$microservice$endpoint');
  }
}