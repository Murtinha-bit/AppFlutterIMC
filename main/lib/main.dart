import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Pagina()));
}

class Pagina extends StatefulWidget {
  PaginaState createState() {
    return PaginaState();
  }
}

class PaginaState extends State<Pagina> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String resp = "";
  calcula() {
    double altura = double.parse(this.alturaController.text);
    double peso = double.parse(this.pesoController.text);
    double imc = peso / (altura * altura);
    String classificacao = "";
    if (imc < 16) {
      classificacao = "Magreza grave";
    } else {
      if (imc >= 16 && imc < 17) {
        classificacao = "Magreza moderada";
      } else {
        if (imc >= 17 && imc < 18.5) {
          classificacao = "Magreza leve";
        } else {
          if (imc >= 18.5 && imc < 25) {
            classificacao = "Saudavel";
          } else {
            if (imc >= 25 && imc < 30) {
              classificacao = "Sobrepeso";
            } else {
              if (imc >= 30 && imc < 35) {
                classificacao = "Obesidade Grau 1";
              } else {
                if (imc >= 35 && imc < 40) {
                  classificacao = "Obesidade Grau 2";
                } else {
                  classificacao = "Obesidade Grau 3";
                }
              }
            }
          }
        }
      }
    }
    this.resp = "O seu IMC é : " +
        imc.toStringAsFixed(2) +
        " e a sua classificação é : $classificacao";
    return resp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMC"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Digite seu peso",
              style: TextStyle(fontSize: 15),
            ),
            TextField(
              controller: pesoController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () => pesoController.clear(),
                    icon: Icon(Icons.clear)),
                border: OutlineInputBorder(),
              ),
            ),
            Text("Digite sua altura", style: TextStyle(fontSize: 15)),
            TextField(
              controller: alturaController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () => alturaController.clear(),
                    icon: Icon(Icons.clear)),
                border: OutlineInputBorder(),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () {
                  setState(calcula);
                },
                child: Text("Calcular", style: TextStyle(fontSize: 20)),
              )
            ]),
            Text(resp, style: TextStyle(color: Colors.red, fontSize: 20))
          ],
        ),
      ),
    );
  }
}
