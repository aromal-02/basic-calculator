import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget calcButton(String bname, Color bcolor, Color tcolor) {
    return GestureDetector(
        onTap: () => calculation(bname),
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: bcolor,
          ),
          child: Center(
            child: Text(
              bname,
              style: TextStyle(
                fontSize: 38,
                color: tcolor,
              ),
            ),
          ),
        ));
  }

  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '0';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(String btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = (numOne / 100).toString();
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-$result';
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Calculator",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  text,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 100, color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton("AC", const Color.fromARGB(255, 106, 104, 104),
                  const Color.fromARGB(255, 0, 0, 0)),
              calcButton("+/-", const Color.fromARGB(255, 106, 104, 104),
                  const Color.fromARGB(255, 0, 0, 0)),
              calcButton("%", const Color.fromARGB(255, 106, 104, 104),
                  const Color.fromARGB(255, 0, 0, 0)),
              calcButton("/", const Color.fromARGB(255, 248, 146, 3),
                  const Color.fromARGB(255, 255, 255, 255)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton("7", const Color.fromARGB(66, 92, 91, 91),
                  const Color.fromARGB(255, 255, 255, 255)),
              calcButton("8", const Color.fromARGB(66, 92, 91, 91),
                  const Color.fromARGB(255, 255, 255, 255)),
              calcButton("9", const Color.fromARGB(66, 92, 91, 91),
                  const Color.fromARGB(255, 255, 255, 255)),
              calcButton("x", const Color.fromARGB(255, 248, 146, 3),
                  const Color.fromARGB(255, 255, 255, 255)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton("4", const Color.fromARGB(66, 92, 91, 91),
                  const Color.fromARGB(255, 255, 255, 255)),
              calcButton("5", const Color.fromARGB(66, 92, 91, 91),
                  const Color.fromARGB(255, 255, 255, 255)),
              calcButton("6", const Color.fromARGB(66, 92, 91, 91),
                  const Color.fromARGB(255, 255, 255, 255)),
              calcButton("-", const Color.fromARGB(255, 248, 146, 3),
                  const Color.fromARGB(255, 255, 255, 255)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton("1", const Color.fromARGB(66, 92, 91, 91),
                  const Color.fromARGB(255, 255, 255, 255)),
              calcButton("2", const Color.fromARGB(66, 92, 91, 91),
                  const Color.fromARGB(255, 255, 255, 255)),
              calcButton("3", const Color.fromARGB(66, 92, 91, 91),
                  const Color.fromARGB(255, 255, 255, 255)),
              calcButton("+", const Color.fromARGB(255, 248, 146, 3),
                  const Color.fromARGB(255, 255, 255, 255)),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              calcButton("0", const Color.fromARGB(66, 92, 91, 91),
                  const Color.fromARGB(255, 255, 255, 255)),
              calcButton("00", const Color.fromARGB(66, 92, 91, 91),
                  const Color.fromARGB(255, 255, 255, 255)),
              calcButton(".", const Color.fromARGB(66, 92, 91, 91),
                  const Color.fromARGB(255, 255, 255, 255)),
              calcButton("=", const Color.fromARGB(255, 248, 146, 3),
                  const Color.fromARGB(255, 255, 255, 255)),
            ],
          ),
        ],
      ),
    );
  }
}
