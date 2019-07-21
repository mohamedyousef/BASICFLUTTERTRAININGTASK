import 'package:first_app/calculateWieght.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

void main()=>runApp(new MyHomePAGE()) ;

class MyHomePAGE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Login",debugShowCheckedModeBanner: true,
      home: new Login(),
    );
  }
}

class Login extends StatefulWidget {

  @override
      _LoginState createState() => _LoginState();
 }
 class _LoginState extends State<Login> {

  final globalKey = GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  String msg = "";

      @override
      Widget build(BuildContext context) {
        return  new Scaffold(
          appBar: AppBar(title: Text("Flutter Login Demo"),centerTitle: true,),
          body: Column(children: <Widget>[
           Container(child:
           SvgPicture.asset("assets/img/logo.svg"),margin: EdgeInsets.only(top: 50),) ,
            SizedBox(height: 100,),
            drawForm()
          ],),
        );
      }

      Widget drawForm(){
        return Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: inputField(false,Icons.email, "Email Address Cant be empty"
                    ,TextInputType.emailAddress,email),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: inputField(true,Icons.lock, "Password Cant be empty"
                    ,TextInputType.text,password),
              ),
              Text(msg),
              Container(
                margin: EdgeInsets.only(left: 40,right: 40),
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(30)),child: Text("Login",style: TextStyle(color: Colors.white),),onPressed: (){
                  if(globalKey.currentState.validate())
                    {
                      if(email.text.toString()=="mohamed@uniyapps.com" &&
                          password.text.toString() == "123456789") {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return MyhomePage();
                        }));
                      }
                      else{
                        setState(() {
                          msg=" Email or Password not exists ";
                        });
                      }
                    }
                },),
              ),
              FlatButton(onPressed: (){}, child: Text("Create An Account"),)
            ],
          ),
        );
      }

      Widget inputField(bool secure,IconData icon,String  err_message,TextInputType txt,TextEditingController controller){
       return TextFormField(controller: controller,
         keyboardType: txt,
         obscureText: secure,
          decoration: InputDecoration(
              hintText: "Enter Field",
              icon: Icon(icon,size: 32,)),
          validator: (value) {
            if (value.isEmpty) {
              return err_message;
            }
            return null;
          },);
      }

      @override
      void dispose() {email.dispose();password.dispose();}

}
