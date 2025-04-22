import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contador_provider/providers/contador_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContadorProvider(),
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador Global',
      theme: ThemeData(        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ContadorPagina(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContadorPagina extends StatefulWidget {
  const ContadorPagina({super.key});

  @override
  State<ContadorPagina> createState() => _ContadorPaginaState();
}
class _ContadorPaginaState extends State<ContadorPagina> {

  @override
  Widget build(BuildContext context) {
    final contador = Provider.of<ContadorProvider>(context);

    return Scaffold(
      appBar: AppBar(        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Contador Global'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Contador atual:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${contador.contador}',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: contador.incrementar, child: const Icon(Icons.add)
                ),
                ElevatedButton(
                  onPressed: contador.decrementar, child: const Icon(Icons.remove)
                )
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
