abstract class ApiEndpoints {
  static final baseUrl = "https://api.artic.edu/api";
  static final artworks = "$baseUrl/v1/artworks";
  static String artwork(int id) => "$artworks/$id";
}