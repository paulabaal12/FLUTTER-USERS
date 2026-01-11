import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

// maneja las solucitudes a la API de usuarios
class UserService {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  // se obtiene la lista de usuarios
  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/users'),
      );

      if (response.statusCode == 200) {
        // Si la solicitud es exitosa, parseamos el JSON
        List<dynamic> jsonData = json.decode(response.body);
        List<User> users = jsonData.map((user) => User.fromJson(user)).toList();
        
        // Ordenar alfabéticamente por nombre
        users.sort((a, b) => a.name.compareTo(b.name));
        
        return users;
      } else {
        throw Exception('Error al cargar usuarios');
      }
    } catch (e) {
      throw Exception('No se pudo cargar la información');
    }
  }
}
