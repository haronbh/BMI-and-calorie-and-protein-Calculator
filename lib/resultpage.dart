import 'package:flutter/material.dart';
import 'theame.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;
  final int age;
  final String sex;

  ResultPage({required this.height, required this.weight, required this.age, required this.sex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#1C2120"),
      appBar: AppBar(
        title: Text('VOTRE RÉSULTAT'),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Result(height: height, weight: weight, age: age, sex: sex),
    );
  }
}

class Result extends StatefulWidget {
  final int height;
  final int weight;
  final int age;
  final String sex;

  Result({required this.height, required this.weight, required this.age, required this.sex});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: primary,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "$headline",
                    style: headlines,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        _buildResultItem(
                          label: 'IMC',
                          value: '${bmiResult(widget.height, widget.weight)}',
                          color: _getBMIColor(bmiResult(widget.height, widget.weight)),
                        ),
                        SizedBox(height: 10),
                        _buildResultItem(
                          label: 'Calories',
                          value: '${calculateCalories()} kcal/jour',
                          color: Colors.blue, // Couleur de la valeur des calories
                        ),
                        SizedBox(height: 10),
                        _buildResultItem(
                          label: 'Protéines',
                          value: '${calculateProtein()} g/jour',
                          color: Colors.green, // Couleur de la valeur des protéines
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text('Plage de IMC normale:', style: headlines),
                      SizedBox(height: 10),
                      Text(
                        "18.5 - 25 kg/m",
                        style: headlines,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '$comment',
                    style: headlines,
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            color: HexColor("#FF5757"), // Couleur de fond du bouton
            margin: EdgeInsets.only(top: 10.0),
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Text(
                'RE-CALCULER',
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultItem({required String label, required String value, required Color color}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Cette fonction retourne une couleur en fonction de l'IMC
  Color _getBMIColor(int bmi) {
    if (bmi < 18.5) {
      return Colors.pink; // Couleur pour le sous-poids
    } else if (bmi >= 18.5 && bmi < 25) {
      return Colors.green; // Couleur pour le poids santé
    } else if (bmi > 25 && bmi <= 29.99) {
      return Colors.orange; // Couleur pour le surpoids
    } else {
      return Colors.red; // Couleur pour l'obésité
    }
  }

  int calculateCalories() {

    double calories = 0;

    if (widget.sex == 'Homme') {
      // homme
      calories = (10 * widget.weight) + (6.25 * widget.height) - (5 * widget.age) + 5;
    } else {
      // femme
      calories = (10 * widget.weight) + (6.25 * widget.height) - (5 * widget.age) - 161;
    }

    return calories.round();
  }

  int calculateProtein() {

    double protein = 0;

    if (widget.sex == 'Homme') {
      // homme
      protein = widget.weight * 1.2;
    } else {
      // femme
      protein = widget.weight * 1.1;
    }

    return protein.round();
  }

  var comment = '';
  var headline = '';

  int bmiResult(int h, int w) {
    double bmi = (w / (h * h)) * 10000;

    if (bmi < 18.5) {
      comment = "Vous êtes en sous-poids";
      headline = "INSUFFISANCE PONDERALE";
    } else if (bmi >= 18.5 && bmi < 25) {
      comment = "Vous êtes à un poids santé.";
      headline = "NORMAL";
    } else if (bmi > 25 && bmi <= 29.99) {
      comment = "Vous êtes en surpoids.";
      headline = "SURPOIDS";
    } else {
      comment = "Vous êtes obèse.";
      headline = "OBESE";
    }

    return bmi.round();
  }
}
