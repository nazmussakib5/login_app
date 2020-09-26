import 'dart:ui';

import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

//Data Class
class _loginData{

  String name = "";
  String password ="";
}




class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();

  _loginData _data = new _loginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //add image
          Center(
            child: Image.asset(
              "images/face.png",
              width: 90,
              height: 90,
              color: Colors.white,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  gapPadding: 20.9,
                  borderRadius: BorderRadius.circular(20.9)
                )
              ),
              validator: (value){
                if(value.isEmpty){
                  return "Please enter name";
                }else {
                  //show someting
                 _data.name = value;
                 print("Data: ${_data.name}");

                }
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Passworld",
                border: OutlineInputBorder(
                  gapPadding: 20.9,
                  borderRadius: BorderRadius.circular(20.9),
                )
              ),

              validator: (value){
                if(value.isEmpty){
                  return "Please enter Password";
                }else {
                  //show someting
                 _data.password = value;
                 print("Data: ${_data.password}");

                }
              },
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Add the actual buttons
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()) {
                        setState(() {
                          _data.name = _data.name;
                        });
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text("All is Goog")));
                      }

                    },
                    child: Text("Submit"),


                  ),
                ),

                RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()) {
                        //clear
                        _formKey.currentState.reset();
                        setState(() {
                          _data.name = "";
                        });

                      }

                    },
                   child: Text("Clear"),
                )



              ],
            ),
          ),

           Padding(
             padding: const EdgeInsets.all(12.0),
             child: Center(
                 child: _data.name.isEmpty ? Text(""): Text(
                 "Welcome ${_data.name}",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20.0,
                 color: Colors.white,
               ),


             )),
           ),




          
        ],
      ),
    );
  }
}









