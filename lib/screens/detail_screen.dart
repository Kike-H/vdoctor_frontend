import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vdoctor_frontend/utils/const.dart';
import 'package:vdoctor_frontend/widgets/checkbox.dart';
import 'package:vdoctor_frontend/widgets/custom_clipper.dart';
import 'package:vdoctor_frontend/widgets/grid_item.dart';
import 'package:vdoctor_frontend/widgets/progress_vertical.dart';

class DetailScreen extends StatelessWidget {
  final tos = CheckBox();
  final mucosidad = CheckBox();
  final fatiga = CheckBox();
  final fiebre = CheckBox();
  final congestion = CheckBox();
  final dGarganta = CheckBox();
  final dCorporal = CheckBox();
  final dCabezado = CheckBox();
  final dOidos = CheckBox();
  final diarrea = CheckBox();
  final nauseas = CheckBox();
  final vomito = CheckBox();
  final dAbdominal = CheckBox();

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    // For Grid Layout
    double _crossAxisSpacing = 16, _mainAxisSpacing = 16, _cellHeight = 150.0;
    int _crossAxisCount = 2;

    double _width =
        (MediaQuery.of(context).size.width - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
            _crossAxisCount;
    double _aspectRatio = _width / (_cellHeight + _mainAxisSpacing + (_crossAxisCount + 1));

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(clipType: ClipType.bottom),
            child: Container(
              color: Constants.darkGreen,
              height: Constants.headerHeight + statusBarHeight,
            ),
          ),

          Positioned(
            right: -45,
            top: -30,
            child: ClipOval(
              child: Container(
                color: Colors.black.withOpacity(0.05),
                height: 220,
                width: 220,
              ),
            ),
          ),

          // BODY
          Padding(
            padding: EdgeInsets.all(Constants.paddingSide),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // Back Button
                        SizedBox(
                          width: 34,
                          child: RawMaterialButton(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios, size: 15.0, color: Colors.white),
                            shape: CircleBorder(
                              side: BorderSide(
                                  color: Colors.white, width: 2, style: BorderStyle.solid),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Symptom",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              mainAxisAlignment: MainAxisAlignment.start,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                SizedBox(width: 10),
                                Text(
                                  "Select your symptom",
                                  style: TextStyle(fontSize: 15, color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img/health.png'),
                        height: 73,
                        width: 80,
                        color: Colors.white.withOpacity(0.5)),
                  ],
                ),
                SizedBox(height: 30),
                // Chart
                Material(
                  shadowColor: Colors.grey.withOpacity(0.01), // added
                  type: MaterialType.card,
                  elevation: 10, borderRadius: new BorderRadius.circular(10.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(20.0),
                    height: 400,
                    child: ListView(
                      children: [
                        Row(children: [
                          tos,
                          const Text(
                            "Tos",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                        Row(children: [
                          mucosidad,
                          const Text(
                            "Mucosidad",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                        Row(children: [
                          fatiga,
                          const Text(
                            "Fatiga",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                        Row(children: [
                          fiebre,
                          const Text(
                            "Fiebre",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                        Row(children: [
                          congestion,
                          const Text(
                            "Congestión Nasal",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                        Row(children: [
                          dGarganta,
                          const Text(
                            "Dolor de garganta",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                        Row(children: [
                          dCorporal,
                          const Text(
                            "Dolor Corporal",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                        Row(children: [
                          dCabezado,
                          const Text(
                            "Dolor de cabeza",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                        Row(children: [
                          dOidos,
                          const Text(
                            "Dolor de oídos",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                        Row(children: [
                          diarrea,
                          const Text(
                            "Diarrea",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                        Row(children: [
                          nauseas,
                          const Text(
                            "Nauseas",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                        Row(children: [
                          vomito,
                          const Text(
                            "Vomito",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                        Row(children: [
                          dAbdominal,
                          const Text(
                            "Dolor abdominal",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ]),
                      ],
                    ),
                  ), // added
                ),
                const SizedBox(
                  height: 34,
                ),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    var lol = tos.getValue() ? 1 : 0;
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Text("Result"),
                              content: Text("You have cancer ${lol}"),
                            ));
                    debugPrint(lol.toString());
                  },
                  color: const Color.fromARGB(255, 68, 197, 126),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Send",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}