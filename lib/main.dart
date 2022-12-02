//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  //Importa o pacote do Material e informa que se trata de um
  //MaterialApp
  //Instanciando a Widget
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //construtor MyApp
  const MyApp({Key? key}) : super(key: key);

  @override
  //
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Rodando o MaterialApp
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  void decrement() {
    setState(() {
      count--;
    });

    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });

    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imagens/20140803_125518.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              //Centralizando os compomentes da coluna principal (Contador e Texto superior)
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isFull ? 'Lotado' : 'Pode Entrar!',
                  style: TextStyle(
                    fontSize: 30,
                    color: isFull ? Colors.red : Colors.white,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(40),
                    child: Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 100,
                        color: (isFull ? Colors.red : Colors.white),
                      ),
                    )),
                //Centralizando os botões da widget ROW
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrement,
                    //Configuração de aparência do botão
                    style: TextButton.styleFrom(
                      backgroundColor: isEmpty
                          ? Colors.white.withOpacity(0.2)
                          : Colors.white,
                      //Determina o tamanho padrão do botão
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      //Configuração da borda do botão
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Saiu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  TextButton(
                    onPressed: isFull ? null : increment,
                    style: TextButton.styleFrom(
                        backgroundColor: isFull
                            ? Colors.white.withOpacity(0.2)
                            : Colors.white,
                        fixedSize: const Size(100, 100),
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )),
                    child: const Text(
                      'Entrou',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ]),
              ]),
        ));
  }
}




  
