import 'package:dio/dio.dart';
import '../models/job.dart';
import '../models/application.dart';
import '../models/chat_message.dart';
import '../params/job_create_params.dart';
import '../params/application_create_params.dart';
import '../params/chat_message_create_params.dart';

class JobBoardApiService {
  static const String baseUrl = 'http://13.55.128.130:8000/api';
  late final Dio _dio;

  JobBoardApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add interceptor for logging
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) => print(object),
    ));
  }

  // Job endpoints
  Future<List<Job>> getJobs() async {
    try {
      final response = await _dio.get('/jobs/');
      final List<dynamic> data = response.data;
      return data.map((json) => Job.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch jobs: $e');
    }
  }

  Future<Job> getJob(int id) async {
    try {
      final response = await _dio.get('/jobs/$id/');
      return Job.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch job: $e');
    }
  }

  Future<Job> createJob(JobCreateParams params) async {
    try {
      final response = await _dio.post('/jobs/', data: params.toJson());
      return Job.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create job: $e');
    }
  }

  Future<Job> updateJob(int id, JobCreateParams params) async {
    try {
      final response = await _dio.put('/jobs/$id/', data: params.toJson());
      return Job.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update job: $e');
    }
  }

  Future<void> deleteJob(int id) async {
    try {
      await _dio.delete('/jobs/$id/');
    } catch (e) {
      throw Exception('Failed to delete job: $e');
    }
  }

  // Application endpoints
  Future<List<Application>> getApplications() async {
    try {
      final response = await _dio.get('/applications/');
      final List<dynamic> data = response.data;
      return data.map((json) => Application.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch applications: $e');
    }
  }

  Future<List<Application>> getApplicationsByJob(int jobId) async {
    try {
      final response = await _dio.get('/applications/', queryParameters: {'job': jobId});
      final List<dynamic> data = response.data;
      return data.map((json) => Application.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch applications for job: $e');
    }
  }

  Future<Application> applyJob(ApplicationCreateParams params) async {
    try {
      final response = await _dio.post('/applications/', data: params.toJson());
      return Application.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to apply for job: $e');
    }
  }

  // Chat endpoints
  Future<List<ChatMessage>> getChatMessages() async {
    try {
      final response = await _dio.get('/chats/');
      final List<dynamic> data = response.data;
      return data.map((json) => ChatMessage.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch chat messages: $e');
    }
  }

  Future<List<ChatMessage>> getChatMessagesBetweenUsers(int senderId, int receiverId) async {
    try {
      final response = await _dio.get('/chats/', queryParameters: {
        'sender': senderId,
        'receiver': receiverId,
      });
      final List<dynamic> data = response.data;
      return data.map((json) => ChatMessage.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch chat messages between users: $e');
    }
  }

  Future<ChatMessage> sendChatMessage(ChatMessageCreateParams params) async {
    try {
      final response = await _dio.post('/chats/', data: params.toJson());
      return ChatMessage.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to send chat message: $e');
    }
  }
}