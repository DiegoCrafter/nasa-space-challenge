import 'package:covid_19/main.dart';
import 'package:covid_19/widgets/custom_button.dart';
import 'package:covid_19/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

enum Gender { male, female }

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 80,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 38),
                      child: Text(
                        'Registrarse'.trim(),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1B8D59)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    WidgetSignup(),
                    Expanded(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 38),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${'ya estas registrado?'.trim()} ?',
                              style: TextStyle(
                                color: Color(0xffbcbcbc),
                                fontSize: 12,
                                fontFamily: 'NunitoSans',
                              ),
                            ),
                            Text('   '),
                            InkWell(
                              borderRadius: BorderRadius.circular(2),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomeScreen()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  'Iniciar sesion'.trim(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class WidgetSignup extends StatefulWidget {
  @override
  _WidgetSignupState createState() => _WidgetSignupState();
}

class _WidgetSignupState extends State<WidgetSignup> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Nombres'.trim(),
                style: kInputTextStyle,
              ),
              CustomTextFormField(
                controller: _firstNameController,
                hintText: 'Ingrese su nombre',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Apellidos'.trim(),
                style: kInputTextStyle,
              ),
              CustomTextFormField(
                controller: _lastNameController,
                hintText: 'Ingrese sus apellidos',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Peso'.trim(),
                style: kInputTextStyle,
              ),
              CustomTextFormField(
                controller: _lastNameController,
                hintText: 'Ingrese su peso (Kg)',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Talla'.trim(),
                style: kInputTextStyle,
              ),
              CustomTextFormField(
                controller: _lastNameController,
                hintText: 'Ingrese su talla (cm)',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Genero'.trim(),
                style: kInputTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              Radio(
                value: Gender.male,
                groupValue: _gender,
                onChanged: (gender) {
                  setState(() {
                    _gender = gender;
                  });
                },
              ),
              Text(
                'M'.trim(),
                style: kInputTextStyle,
              ),
              SizedBox(
                width: 30,
              ),
              Radio(
                value: Gender.female,
                groupValue: _gender,
                onChanged: (gender) {
                  setState(() {
                    _gender = gender;
                  });
                },
              ),
              Text(
                'F'.trim(),
                style: kInputTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Correo electronico'.trim(),
                style: kInputTextStyle,
              ),
              CustomTextFormField(
                controller: _emailController,
                hintText: 'Ingrese su correo electronico',
              ),
              SizedBox(
                height: 20,
              ),
               Text(
                'Fecha de nacimiento'.trim(),
                style: kInputTextStyle,
              ),
              CustomTextFormField(
                controller: _passwordController,
                hintText: 'Ingrese su fecha de nacimiento',
              ),
              CustomButton(
                onPressed: () {},
                text: 'Registrarse'.trim(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
