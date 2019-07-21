import 'package:flutter/material.dart';

/* inkwell = riplle effect and  make click to any elemnt
*  center
*  crossAxis
*  mainAxixELement
*  setstate change data realtime  on ui
* */


class MyhomePage extends StatefulWidget {
  String title ;

  MyhomePage({this.title});

  @override
  _MyhomePageState createState() => _MyhomePageState();
}
class _MyhomePageState extends State<MyhomePage> {

  Widget inputfield(placeholder,controllername){
    return Padding(
      padding:  EdgeInsets.all(4.0),
      child:TextField(
        controller: controllername,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(45))),hintText: placeholder),),
    );
  }

  TextEditingController length = new TextEditingController();
  TextEditingController weight = new TextEditingController();

  String sizetxt = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("home page"),)
      ,body: Padding(
        padding: const EdgeInsets.only(left: 40,right: 40, top:20),
        child: Column(children: <Widget>[
          inputfield("Enter Your Weight in kg ", weight),
          inputfield("Enter Your Length in cm ", length),
          MaterialButton(child:Text("Calculate"),textColor: Colors.white,color: Colors.lightBlue,onPressed: (){
            setState(() {
                sizetxt = (int.parse(weight.text) + int.parse(length.text)).toString();
            });
          },)  ,
          Text(sizetxt)
        ],),
      ),);




  }


  @override
  void dispose() {
    super.dispose();
    length.dispose();
    weight.dispose();
  }
}




