import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseService._internal();

  static final SupabaseService _instance = SupabaseService._internal();

  Supabase? _supabaseClient;

  factory SupabaseService() {
    return _instance;
  }

  Future<void> initialize() async {
    // TODO: move this keys to .env files
    _supabaseClient ??= await Supabase.initialize(
      url: 'https://orbhfmrzumcquwyvzuij.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9yYmhmbXJ6dW1jcXV3eXZ6dWlqIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcyNzYwNzcyOSwiZXhwIjoyMDQzMTgzNzI5fQ.qgDwMzRKm9OwGNlbbHtj4y8L_5W7ohnrzcZI7nJp4NQ',
    );
  }

  SupabaseClient get client {
    if (_supabaseClient == null) {
      throw Exception(
          "SupabaseService is not initialized. Call initialize() first.");
    }
    return _supabaseClient!.client;
  }
}
