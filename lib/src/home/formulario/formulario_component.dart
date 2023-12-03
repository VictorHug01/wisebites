import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zerowate/src/home/formulario/cadastro_mixin_validator.dart';
import 'package:zerowate/src/home/home_page.dart';
import 'package:zerowate/src/theme/theme_class.dart';

class FormularioComponent extends StatefulWidget {
  const FormularioComponent({super.key});

  @override
  State<FormularioComponent> createState() => _FormularioComponentState();
}

class _FormularioComponentState extends State<FormularioComponent>
    with ValidationMixinClass {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerEscola = TextEditingController();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
        fontSize: 17,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      enabledBorder: inputBorderComponent,
      focusedBorder: inputBorderComponent,
      disabledBorder: inputBorderComponent,
    );
  }

  final InputBorder inputBorderComponent = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: BorderSide(
      color: ColorThemeClass.colorPrimary,
      width: 2.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width < 650
              ? MediaQuery.of(context).size.width / 1.5
              : MediaQuery.of(context).size.width / 1.9,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _keyForm,
              child: Center(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(
                        height: 90,
                      ),
                      Text(
                        'COMECE AGORA!',
                        softWrap: true,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.width / 25.0,
                          color: ColorThemeClass.colorPrimary,
                        ),
                      ),
                      Text(
                        'PREENCHA ABAIXO PARA PARTICIPAR!',
                        softWrap: false,
                        textAlign: MediaQuery.of(context).size.width < 650
                            ? TextAlign.center
                            : TextAlign.left,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          fontSize: MediaQuery.of(context).size.width / 50.0,
                          color: ColorThemeClass.colorPrimary,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          validator: isNotEmpyt,
                          controller: controllerEscola,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Nome da escola:",
                            labelStyle: const TextStyle(
                              fontSize: 17,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            enabledBorder: inputBorderComponent,
                            focusedBorder: inputBorderComponent,
                            disabledBorder: inputBorderComponent,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          validator: isNotEmpyt,
                          controller: controllerNome,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Nome da pessoa:",
                            labelStyle: const TextStyle(
                              fontSize: 17,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            enabledBorder: inputBorderComponent,
                            focusedBorder: inputBorderComponent,
                            disabledBorder: inputBorderComponent,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          validator: isNotEmpyt,
                          controller: controllerEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email para contato:",
                            labelStyle: const TextStyle(
                              fontSize: 17,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            enabledBorder: inputBorderComponent,
                            focusedBorder: inputBorderComponent,
                            disabledBorder: inputBorderComponent,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.all(15.0),
                            backgroundColor: ColorThemeClass.colorPrimary,
                          ),
                          onPressed: () {
                            if (_keyForm.currentState!.validate()) {
                              _keyForm.currentState!.save();
                              CoolAlert.show(
                                context: context,
                                width: MediaQuery.of(context).size.width / 3,
                                type: CoolAlertType.success,
                                title: 'Sucesso!',
                                text: 
                                  "Escola: ${controllerEscola.text}\n" +
                                  "Nome: ${controllerNome.text}\n" +
                                  "Email: ${controllerEmail.text}\n",
                                loopAnimation: false,
                                backgroundColor: ColorThemeClass.colorSecondary,
                                cancelBtnText: '',
                                borderRadius: 6.0,
                                confirmBtnText: 'Confirmar',
                                confirmBtnColor: ColorThemeClass.colorPrimary,
                                showCancelBtn: false,
                                onConfirmBtnTap: () {
                                  _keyForm.currentState!.reset();
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (_) => const MyHomePage(),
                                    ),
                                  );
                                },
                              );
                            }
                            ;
                          },
                          child: Text(
                            "Avançar",
                            style: TextStyle(
                              fontSize: 18,
                              color: ColorThemeClass.colorSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
