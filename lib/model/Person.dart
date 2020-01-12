import 'dart:convert';
import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'HttpException.dart';

class Person with ChangeNotifier {
   String name;
   String phone;
   String address;
   String userType;
   String _token;

   bool get isAuth {
      return _token != null;
   }

   String get token {
      return _token;
   }

   Future<void> _authenticate(String phone, String pin) async {
      final url =
          'http://10.0.2.2:8081/v1/login?phone=';
      try {
         final response = await http.get(
            url+phone+'&pin='+pin,
            /*body: json.encode(
               {
                  'phone': phone,
                  'pin': pin,
                  'returnSecureToken': true,
               },
            ),*/
         );

         final responseData = json.decode(response.body);
         if (responseData['error'] != null) {
            throw HttpException(responseData['error']['message']);
         }
         _token = responseData['response']['accessToken'];
         name = responseData['response']['name'];
         phone = phone;

         notifyListeners();
         await saveUserDataToDevice();
      } catch (error) {
         throw error;
      }
   }

   Future saveUserDataToDevice() async {
     final prefs = await SharedPreferences.getInstance();
     final userData = json.encode(
         {
            'token': _token,
            'name': name,
            'phone':phone,
         },
     );
     prefs.setString('userData', userData);
   }

   /*Future<void> signup(String email, String password) async {
      return _authenticate(email, password, 'signupNewUser');
   }*/

   Future<void> login(String phone, String pin) async {
      return _authenticate(phone, pin);
   }

   Future<bool> tryAutoLogin() async {
      final prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey('userData')) {
         return false;
      }
      final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;

      _token = extractedUserData['token'];
      name = extractedUserData['name'];
      phone = extractedUserData['phone'];

      if(!isValidToken(_token,phone)) {
        return false;
      }
      notifyListeners();
      //_autoLogout();
      return true;
   }


  bool isValidToken(String token, String phone) {
      //TODO make a rest call to confirm if token is valid
     return true;

  }


   Future<void> logout() async {
      _token = null;
      name = null;

      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      // prefs.remove('userData');
      prefs.clear();
   }



}
