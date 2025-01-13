/*

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarterminal/product/pages/home/homeView.dart';

mixin loginViewMixin{

  Future<void> _handleLoginUser(BuildContext context, GlobalKey<FormState> loginFormKey, String username, String code) async{
    // login user
    if (loginFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting data..')),
      );


      loginFormKey.currentState!.save();
      bool isLogin = await loginUser(username, code);

      /* burada sayfa donusumleri ayarlanmalı */
      if ( isLogin ) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const homeView())
        );
      } else ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong code...')),
      );
    }
  }

  Future<bool> loginUser(String email , String password) async{
    try{

      bool flag = false;

      await fire_auth.signInWithEmailAndPassword(email: email, password: password);
      await Helper.isVerified(fire_auth.currentUser?.uid);

      if ( Helper.isVerifiedUser ){
        await FirebaseFirestore.instance
            .collection('users')
            .doc(fire_auth.currentUser?.uid)
            .get()
            .then((value) {
          user.currentUser = new user( id: value["id"],
              name: value["name"],
              surname: value["surname"],
              mail: value["mail"],
              telNum: value["telephone"],
              sClass: value["sClass"],
              department: value["department"],
              committee: value["committee"],
              password: "1",
              level: value["level"]
          );
          flag = true;
        });
      }
      else{
        Fluttertoast.showToast(
          msg: "Eğer daha önceden register olduysan komite başkanından onay iste!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.amber,
          textColor: Colors.white,
          fontSize: 10.0,
        );
      }

      if(flag){ // save user local
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', user.currentUser.id);
      }
      return flag;

    }catch(error){
      print(error.toString());
      return false;
    }
  }
}

 */