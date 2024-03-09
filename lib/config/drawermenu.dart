import 'package:app_imc/homepage.dart';
import 'package:app_imc/sobrepage.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/image1.jpg'),
                fit: BoxFit.cover,
              ),
              color: Colors.green,
            ),
            child: Text(
              "Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.calculate,
              size: 20,
              color: Colors.green,
            ),
            // trailing: const Icon(Icons.calculate),
            title: const Text(
              'Cálculo IMC',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              size: 20,
              color: Colors.green,
            ),
            title: const Text(
              'Sobre o App',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Sobre()),
              );
            },
          ),
        ],
      ),
    );
  }
}
