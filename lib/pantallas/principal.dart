import 'package:combu_soporte/pantallas/login.dart';
import 'package:flutter/material.dart';

//clase principal paginaPrincipal
class Pprincipal extends StatefulWidget {
  const Pprincipal({Key? key}) : super(key: key);

  @override
  State<Pprincipal> createState() => _PPrincipalState();
}

class _PPrincipalState extends State<Pprincipal> {
  @override
  Widget build(BuildContext context) {
    @override
    final tamao = MediaQuery.of(context).size;
    //scar
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistemas Soporte'),
        backgroundColor: const Color.fromRGBO(63, 63, 156, 1),
      ),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity * 8,
          child: Stack(
            children: [
              cajafomulario(tamao),
              iconpersona(),
              paginapp(context),
            ],
          )),
    );
  }

  SingleChildScrollView paginapp(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(height: 160),
        Container(
          //altura texto dentro de formulario
          padding: const EdgeInsets.all(20),
          //expansion horizontal de la caja formulario
          margin: const EdgeInsets.symmetric(horizontal: 20),
          //expansion horizontal de la caja formularo(dentro de la screen)
          width: double.infinity,
          //altura de la caja formulario dentro de la screen
          height: 380,
          //codigo decorativo de caja formulario
          decoration: BoxDecoration(
              //color caja formulario
              color: Colors.white,
              //efecto de borde circular
              borderRadius: BorderRadius.circular(30),
              //codigo efecto borde con sombra
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 15,
                  offset: Offset(0, 5),
                )
              ]),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text('Generar Reporte',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 10),
            ],
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Plogin()),
              );
            },
            style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromRGBO(63, 63, 156, 1)),
            child: const Text('regresar')),
      ],
    ));
  }

  Container cajafomulario(Size tamao) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(79, 60, 164, 1),
        ])),
        width: double.infinity,
        height: tamao.height * 0.43);
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
            Icons.deblur_outlined,
            color: Colors.white,
            size: 100,
          )),
    );
  }
}

class Soporte extends StatelessWidget {
  const Soporte({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          "Soporte",
          style: TextStyle(
            color: Color.fromRGBO(63, 63, 156, 1),
            fontSize: 45,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
