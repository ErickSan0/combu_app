import 'package:combu_soporte/pantallas/principal.dart';
import 'package:combu_soporte/widgets/input_decorations.dart';
import 'package:flutter/material.dart';

class Plogin extends StatefulWidget {
  const Plogin({Key? key}) : super(key: key);

  @override
  _PloginState createState() => _PloginState();
}

class _PloginState extends State<Plogin> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;

      if (textFieldFocusNode.hasPrimaryFocus) return;
      textFieldFocusNode.canRequestFocus = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tamao = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            cajafomulario(tamao),
            iconpersona(),
            loginform(context),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView loginform(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 225),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 380,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  )
                ]),
            child: Column(
              children: [
                //posicion superior del texto dentro de caja formulario
                const SizedBox(height: 20),
                //texto desplegado dentro de caja formulario
                Text('Iniciar sesión  ',
                    //estilo de texto desplegado
                    style: Theme.of(context).textTheme.headlineMedium),
                //posicion del texto inferior
                const SizedBox(height: 40),
                //codigo texto dentro de caja
                Form(
                  child: Form(
                    child: Column(
                      children: [
                        //codigo texto 'ingrese usuario' dentro de caja
                        TextFormField(
                          //deshabilitar autocorrectos
                          autocorrect: false,
                          //llamada a widget inputdecorations
                          decoration: Inputdecorations.inputdecoration(
                            hintext: 'Ingrese Usuario',
                            labeltext: 'Usuario',
                            icons: const Icon(Icons.person_2_outlined),
                          ),
                        ),
                        //Distancia que tendra el codigo siguiente con respecto al usuario, finaliza codigo visual user.
                        const SizedBox(height: 30),
                        //codigo texto 'contraseña' dentro de caja
                        TextFormField(
                          autocorrect: false,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscured,
                          focusNode: textFieldFocusNode,
                          decoration: InputDecoration(
                            enabledBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple)),
                            //tipo de borde caja de texto asi como su color al presionar
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2)),
                            //texto mostrado al presionar caja de texto
                            hintText: 'Ingresa contraseña',
                            //texto mostrado como referencia del valor que se debe ingresar
                            labelText: 'Contraseña',
                            //icono que acompaña al texto como referencia visual
                            prefixIcon:
                                const Icon(Icons.lock_rounded, size: 24),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                              child: GestureDetector(
                                onTap: _toggleObscured,
                                child: Icon(
                                  _obscured
                                      ? Icons.visibility_rounded
                                      : Icons.visibility_off_rounded,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //inicia codigo decoracion de caja de texto
                        const SizedBox(height: 30),
                        //codigo boton 'acceder'
                        ElevatedButton(
                            //accion que ejecutara el btn al ser presionado(por programar)
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Pprincipal()),
                              );
                            },
                            //estilo visual del btn incluyendo texto asi como color de texto y color del btn
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 120, vertical: 15),
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromRGBO(63, 63, 156, 1)),
                            child: const Text("Acceder")),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  SafeArea iconpersona() {
    return SafeArea(
      child: Container(
          //posicion del icono partiendo de la altura
          margin: const EdgeInsets.only(top: 40),
          //expansion horizontal del icono
          width: double.infinity,
          //codigo decoratico icono
          child: const Icon(
            Icons.person_pin_sharp,
            color: Colors.white,
            size: 100,
          )),
    );
  }

  Container cajafomulario(Size tamao) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(79, 60, 164, 1),
      ])),
      width: double.infinity,
      height: tamao.height * 0.45,
    );
  }

  showAlertDialog(BuildContext context) {
    // configuracion boton
    Widget okButton = TextButton(
      child: const Text('Regresar'),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // Texto de alerta
    AlertDialog alert = AlertDialog(
      title: const Text("Atención"),
      content: const Text(
          "Si olvidaste tu usuario/contraseña ponte en contacto con el departamento de TI."
          "\n\n\nNombre: \nAlonso Rodriguez\n\nCorreo: \narodriguez@combuservicios.com\n\nCelular: \n663-122-1580"),
      actions: [
        okButton,
      ],
    );
    // mostrar alerta
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return alert;
      },
    );
  }
}
