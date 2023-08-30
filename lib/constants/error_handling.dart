import 'dart:convert';
import 'package:amazon_clone_project/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess
}){

  switch(response.statusCode){
    
    case 200:
      onSuccess();
      break;
    case 400:
      showSnakbar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnakbar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnakbar(context, response.body);

  }
}