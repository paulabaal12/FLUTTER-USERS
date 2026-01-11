import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import '../widgets/user_list_item.dart';

// Pantalla principal que muestra la lista de usuarios
class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final UserService _userService = UserService();
  late Future<List<User>> _futureUsers;

  @override
  void initState() {
    super.initState();
    _futureUsers = _userService.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'Lista de Usuarios',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: _futureUsers,
        builder: (context, snapshot) {
          // Mientras está cargando
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    'Cargando usuarios...',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }
          
          // Si hay un error
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'No se pudo cargar la información',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            );
          }
          
          // Si los datos se cargaron correctamente
          if (snapshot.hasData) {
            final users = snapshot.data!;
            
            return ListView.builder(
              itemCount: users.length,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                return UserListItem(
                  user: users[index],
                  index: index,
                );
              },
            );
          }
          
          // Estado por defecto
          return const Center(
            child: Text('No hay datos disponibles'),
          );
        },
      ),
    );
  }
}
