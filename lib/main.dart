import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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

  @override
  void initState() {
    super.initState();
  }

  final number1 = TextEditingController();
  final number2 = TextEditingController();

  int num1 = 0;
  int num2 = 0;
  late int sum = 0;

  late String error_txt = "";

  void showSum(){
    Fluttertoast.showToast(
      msg: 'Sum of two numbers : '+sum.toString(),
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      gravity: ToastGravity.CENTER,
    );
  }

  @override
  void dispose() {
    number1.dispose();
    number2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Let us Calculate'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  'Enter Numbers : ',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.blue,
                      letterSpacing: .5,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Text(
                error_txt,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    color: Colors.red,
                    letterSpacing: .5,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: number1,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    labelText: "Number - 1",
                    hintText: "Enter the First Number",
                    labelStyle:TextStyle(
                        color: Colors.blue,
                        letterSpacing: .5,
                        fontSize: 20
                    ),
                    hintStyle: TextStyle(
                        letterSpacing: .5,
                        fontSize: 12
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  controller: number2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    labelText: "Number - 2",
                    hintText: "Enter the Second Number",
                    labelStyle:TextStyle(
                        color: Colors.blue,
                        letterSpacing: .5,
                        fontSize: 20
                    ),
                    hintStyle: TextStyle(
                        letterSpacing: .5,
                        fontSize: 12
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                // onPressed: _setNumbers,
                onPressed: (){
                  if(number1.value.text.isEmpty){
                    setState((){
                      sum = 0;
                      error_txt='Please provide number 1 value';
                    });
                  }else if(number2.value.text.isEmpty){
                    setState((){
                      sum = 0;
                      error_txt='Please provide number 2 value';
                    });
                  }
                  else if(number1.value.text.isNotEmpty && number2.value.text.isNotEmpty){
                    setState(() {
                      error_txt='';
                      num1 = int.parse(number1.text);
                      num2 = int.parse(number2.text);
                      sum = num1+num2;
                      showSum();
                    });
                  }
                },
                child: Text(
                  'Sum of Two Numbers',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

