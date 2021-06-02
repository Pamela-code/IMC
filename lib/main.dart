import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

 

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
    var imc;
    String _info = "Informe seus dados";
 _calcular(){
     
    setState(() {
      var pesopronto = double.parse(peso.text);
      var alturapronta = double.parse(altura.text);
      imc = pesopronto / (alturapronta * alturapronta);
      if(imc < 18.6){
        _info = 'Seu IMC é ${imc.toStringAsPrecision(3)} , você está abaixo do peso ideal';
      } else if(imc >= 18.6 && imc < 24.9){
        _info = 'Seu IMC é ${imc.toStringAsPrecision(3)}, você está faixa ideal de peso';
      } else if(imc >= 24.9 && imc < 29.9){
        _info = 'Seu IMC é ${imc.toStringAsPrecision(3)}, você está com sobrepeso';
      } else if(imc >= 29.9 && imc < 34.9){
        _info = 'Seu IMC é ${imc.toStringAsPrecision(3)}, você está com obesidade grau I)';
      } else if(imc >= 34.9 && imc < 39.9){
        _info = 'Seu IMC é ${imc.toStringAsPrecision(3)}, você está com obesidade grau II';
      } else if(imc >= 40){
        _info = 'Seu IMC é ${imc.toStringAsPrecision(3)}, você está com obesidade grau III';
      }
      
    });  
    
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    
    backgroundColor: const Color(0xFF6adbd9),
      body: Center(
        
        child: Column(
          children: [
            Container(
              height: 30, ),
            Container(
              width: 270,
              child: Image.asset("assets/imc.png"),
            ),
            Container(height: 20,),
            Container(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  

                  TextField(
                    style: TextStyle(color:const Color (0xFF066864)),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color:const Color (0xFF066864)),
                      
                      filled: true,
                      fillColor: const Color(0xFFc9fbfa),
                      border: OutlineInputBorder( 
                        borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30)
                        )
                        ),
                    hintText:'Digite o seu Peso'),
                    controller: peso,
                  ),

                  Container(height:28),
                  TextField(
                    
                    style: TextStyle(color: const Color (0xFF066864)),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color:const Color (0xFF066864)),
                      filled: true,
                      fillColor: const Color(0xFFc9fbfa),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30)
                      )
                    ),
                    hintText:'Digite a sua Altura'),
                    controller: altura,
                  ),
                 Container(height:40),
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     padding: EdgeInsets.symmetric(horizontal: 70, vertical: 25),
              shape: 
              
               RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(30.0),
                
                ),
              primary: const Color(0xFF00abbb5),
                   ),
                   onPressed: _calcular, child: Text('Qual o meu IMC?')),
                 Container(height:40),
                 Text(_info, style: TextStyle(color: const Color (0xFF066864)),)            
                  
                ],
              ),
            ),
          ],
        ),
      ), 
    );
  }
}
