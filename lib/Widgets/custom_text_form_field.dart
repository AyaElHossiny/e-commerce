import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({this.inputType,this.icon,this.obscureText=false,this.onchanged,this.hintText,this.prefixIcon,this.labelText,this.suffixIcon}) ;
   String? hintText;
   Widget? prefixIcon;
   String? labelText;
   Widget? suffixIcon;
   Function (String)? onchanged;
   bool? obscureText ;
   Widget? icon;
   TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return  TextFormField (
      keyboardType:inputType,
      validator: (data){
      if(data!.isEmpty){
        return 'field is required';
      }
      },
      obscureText: obscureText!,
      onChanged:onchanged,
      decoration: InputDecoration(
        label: icon,
        hintText: hintText,
        prefixIcon:prefixIcon,
        labelText:labelText ,
        suffixIcon: suffixIcon,
        labelStyle: TextStyle(color: Colors.grey[700]),
        hintStyle:TextStyle(color: Colors.teal) ,
        prefixIconColor: Colors.teal,
        suffixIconColor: Colors.teal,
        enabledBorder:const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
        focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)
        ),
        border:const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),

      ),
    );
  }
}
