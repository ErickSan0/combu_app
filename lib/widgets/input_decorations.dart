import 'package:flutter/material.dart';

class Inputdecorations {
  static InputDecoration inputdecoration({
    required String hintext,
    required String labeltext,
    required Icon icons,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple)),
      //tipo de borde caja de texto asi como su color al presionar
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
      //texto mostrado al presionar caja de texto
      hintText: hintext,
      //texto mostrado como referencia del valor que se debe ingresar
      labelText: labeltext,
      //icono que acompaña al texto como referencia visual
      prefixIcon: icons,
    );
  }
}
