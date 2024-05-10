/* Ejercicio1:

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/" : (context) => Page1(),
        Page2.routeName : (context) => Page2(),
      },
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Ir a la página 2'),
          onPressed: () {
            Navigator.pushNamed(context, Page2.routeName);
          },
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  static const routeName = "/page2"; // Definir la ruta como una variable constante

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Volver'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

*/

// -------------------------------------------------------------//

/* Ejercicio 2: 

import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.initialRoute,
      routes: {
        Routes.initialRoute: (context) => Page1(),
        Routes.page2: (context) => Page2(),
      },
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Página 1 - Ejercicio 2'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Ir a la página 2'),
          onPressed: () {
            Navigator.pushNamed(context, Routes.page2);
          },
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Página 2 - Ejercicio 2'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Volver'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

*/

// ------------------------------------------------------------------------ //

//Ejercicio3
import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Routes.initialRoute,
      routes: {
        Routes.initialRoute: (context) => Page1(),
        Routes.page2: (context) => Page2(),
      },
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página 1 - Ejercicio 3'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  text = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Ingresa un texto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Ir a la página 2'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.page2,
                  arguments: text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? text = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Página 2 - Ejercicio 3'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Texto desde la página 1:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            text != null
                ? Text(
                    text,
                    style: TextStyle(fontSize: 16),
                  )
                : Text(
                    'No se proporcionó ningún texto desde la página 1.',
                    style: TextStyle(fontSize: 16),
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Volver'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
