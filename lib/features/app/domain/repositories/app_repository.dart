abstract class AppRepository {
  Future<String?> getToken();
  Future<bool> clearToken();
}
