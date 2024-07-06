import 'package:flutter/material.dart';
import 'package:app/resultpage.dart';
import 'package:app/theame.dart';

class BmiPage extends StatefulWidget {
  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  int age = 17;
  int weight = 50;
  int height = 180;
  double maxHeight = 220;
  double minHeight = 120;
  String selectedSex = '';

  void ageIncrement() {
    setState(() {
      age++;
    });
  }

  void ageDecrement() {
    setState(() {
      age--;
    });
  }

  void weightIncrement() {
    setState(() {
      weight++;
    });
  }

  void weightDecrement() {
    setState(() {
      weight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculateurs"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: HexColor("#1C2120"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSex = 'Homme';
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: selectedSex == 'Homme' ? HexColor("#FF5757") : HexColor("#8F8E8E"), // Utilisation de la couleur rouge pour le sexe masculin sélectionné
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'images/male.png',
                            height: 100.0,
                            width: 100.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('HOMME', style: headlines.copyWith(fontSize: 20.0)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSex = 'Femme';
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: selectedSex == 'Femme' ? HexColor("#FF5757") : HexColor("#8F8E8E"), // Utilisation de la couleur rouge pour le sexe féminin sélectionné
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'images/female.png',
                            height: 100.0,
                            width: 100.0,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text('FEMME', style: headlines.copyWith(fontSize: 20.0)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 200.0,
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: HexColor("#8F8E8E"), // Background en #8F8E8E
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('TAILLE', style: headlines),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("$height", style: boldNumber),
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: minHeight,
                      max: maxHeight,
                      activeColor: HexColor("#FF5757"), // Utilisation de la couleur rouge pour le curseur actif
                      inactiveColor: Colors.black,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      semanticFormatterCallback: (double newValue) {
                        return '$newValue.round()';
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 200.0,
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: HexColor("#8F8E8E"),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('POIDS', style: headlines.copyWith(fontSize: 20.0)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("$weight", style: boldNumber),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: weightDecrement,
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: HexColor("#FF5757"),
                            ),
                            child: Center(
                              child: Text("-", style: TextStyle(color: Colors.white, fontSize: 30.0)),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.0,
                          width: 40.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: HexColor("#FF5757"),
                          ),
                          child: InkWell(
                            onTap: weightIncrement,
                            child: Center(
                              child: Text("+", style: TextStyle(color: Colors.white, fontSize: 24.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 200.0,
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: HexColor("#8F8E8E"), // Background en #8F8E8E
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('ÂGE', style: headlines.copyWith(fontSize: 20.0)),                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("$age", style: boldNumber),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: ageDecrement,
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            margin: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: HexColor("#FF5757"),
                            ),
                            child: Center(
                              child: Text("-", style: TextStyle(color: Colors.white, fontSize: 30.0)),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.0,
                          width: 40.0,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: HexColor("#FF5757"),
                          ),
                          child: InkWell(
                            onTap: ageIncrement,
                            child: Center(
                              child: Text("+", style: TextStyle(color: Colors.white, fontSize: 24.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (selectedSex.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        height: height,
                        weight: weight,
                        age: age,
                        sex: selectedSex,
                      ),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Veuillez sélectionner le sexe"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Container(
                color: HexColor("#FF5757"),
                margin: EdgeInsets.only(top: 10.0),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Center(
                  child: Text('CALCULER L\'IMC ET LES BESOINS', style: TextStyle(color: Colors.white, fontSize: 20.0) ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
