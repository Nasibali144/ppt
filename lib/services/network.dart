import 'dart:convert';
import 'dart:io';
abstract class Network {
  Future<String> get(String baseUrl, String path, {int? id, Map<String, Object?>? query});
  Future<String> post(String baseUrl, String path, Map<String, dynamic> body);
  Future<String> put(String baseUrl, String path, int id, Map<String, dynamic> body);
  Future<String> patch(String baseUrl, String path, int id, Map<String, dynamic> body);
  Future<String> delete(String baseUrl, String path, int id);
}

class IONetwork implements Network {
  // class setting: singleton
  IONetwork._();

  static final _instance = IONetwork._();

  factory IONetwork() => _instance;

  // object for connection network
  final _network = HttpClient();

  void close() => _network.close();

  // Methods

  /// Get
  @override
  Future<String> get(String baseUrl, String path, {int? id, Map<String, Object?>? query}) async {
    final url = Uri.https(baseUrl, "$path${id != null ? "/$id" : ""}", query);
    final request = await _network.getUrl(url);
    request.headers.contentType = ContentType("application", "json", charset: "utf-8");
    final response = await request.close();
    String result = await response.transform(utf8.decoder).join();
    return result;
  }

  /// Post
  @override
  Future<String> post(String baseUrl, String path, Map<String, dynamic> body) async {
    final url = Uri.https(baseUrl, path);
    final request = await _network.postUrl(url);
    request.headers.contentType = ContentType("application", "json", charset: "utf-8");

    String data = jsonEncode(body);
    List<int> dataByte = utf8.encode(data);
    request.add(dataByte);

    final response = await request.close();
    String result = await response.transform(utf8.decoder).join();
    return result;
  }

  /// Put
  @override
  Future<String> put(String baseUrl, String path, int id, Map<String, dynamic> body) async {
    final url = Uri.https(baseUrl, "$path/$id");
    final request = await _network.putUrl(url);
    request.headers.contentType = ContentType("application", "json", charset: "utf-8");

    String data = jsonEncode(body);
    List<int> dataByte = utf8.encode(data);
    request.add(dataByte);

    final response = await request.close();
    String result = await response.transform(utf8.decoder).join();
    return result;
  }

  /// Patch
  @override
  Future<String> patch(String baseUrl, String path, int id, Map<String, dynamic> body) async {
    final url = Uri.https(baseUrl, "$path/$id");
    final request = await _network.patchUrl(url);
    request.headers.contentType = ContentType("application", "json", charset: "utf-8");

    String data = jsonEncode(body);
    List<int> dataByte = utf8.encode(data);
    request.add(dataByte);

    final response = await request.close();
    String result = await response.transform(utf8.decoder).join();
    return result;
  }

  /// Delete
  @override
  Future<String> delete(String baseUrl, String path, int id) async {
    final url = Uri.https(baseUrl, "$path/$id");
    final request = await _network.deleteUrl(url);
    request.headers.contentType = ContentType("application", "json", charset: "utf-8");
    final response = await request.close();
    String result = await response.transform(utf8.decoder).join();
    return result;
  }
}

enum Api {
  user("/users"),
  post("/posts"),
  comments("/comments"),
  albums("/albums"),
  photos("/photos"),
  todos("/todos"),
  products("/products");

  const Api(this.path);

  final String path;

  static const baseUrl = "jsonplaceholder.typicode.com";
}