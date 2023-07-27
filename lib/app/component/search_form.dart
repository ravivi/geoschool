import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';


const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);

class SearchForm extends StatelessWidget {
  final Function(String val) function;

  const SearchForm({super.key, required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 230, 233, 237),
          borderRadius: BorderRadius.circular(15)
        ),
        child: Form(
          child: TextFormField(
            onChanged: (value) =>
                                function(value),
          
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Rechercher un etablissement ...",
            
              suffixIcon: Icon(Icons.search)
           ),
          ),
        ),
        
      ),
    );
  }
}
