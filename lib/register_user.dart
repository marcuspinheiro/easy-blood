import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {

 final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      new GlobalKey<FormFieldState<String>>();

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false, elegibleDonor = true;
  String name, email, phone, cpf, bloodType, sex, password, passwordConfirm, bithDate, state;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Cadastro Usuário"),
      ),
            body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: _formUI(),
            ),
          ),
        ),
    );
  }

  Widget _formUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: new InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            icon: Icon(Icons.person),
            hintText: 'Digite seu name',
            labelText: 'name Completo',
          ),
          maxLength: 40,
          onSaved: (String val) {
            this.name = val;
          },
          validator: _validarname,
        ),
        new TextFormField(
          decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.assignment),
              hintText: 'Digite seu CPF',
              labelText: 'CPF',
            ),
          maxLength: 14,
          validator: _validarCPF,
          onSaved: (String val) {
            cpf = val;
          },
          inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
        ),
        new TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.date_range),
              hintText: 'Digite data de nascimento',
              labelText: 'Data',
            ),
            keyboardType: TextInputType.datetime,
            maxLength: 10,
            onSaved: (String val) {
              bithDate = val;
            },
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],            
            validator: _validarData,
            ),
        new TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.phone),
              hintText: 'Digite seu número',
              labelText: 'Celular',
              prefixText: '+55',
            ),
            keyboardType: TextInputType.phone,
            maxLength: 10,
            validator: _validarCelular,
            onSaved: (String val) {
              this.phone = val;
            },
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ), 
        new TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.email),
              hintText: 'Digite seu E-mail',
              labelText: 'E-mail',
            ),
            keyboardType: TextInputType.emailAddress,
            maxLength: 40,
            validator: _validarEmail,
            onSaved: (String val) {
              this.email = val;
            }),
        new TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: new InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            icon: Icon(Icons.tag_faces),
            hintText: 'Digite seu tipo sanguíneo',
            labelText: 'Tipo Sanguíneo',
          ),
          maxLength: 3,
          onSaved: (String val) {
            this.bloodType = val;
          },
        ),
        new TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: new InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            icon: Icon(Icons.perm_identity),
            hintText: 'Digite seu Sexo (M ou F)',
            labelText: 'Sexo',
          ),
          maxLength: 1,
          onSaved: (String val) {
            this.sex = val;
          },
        ),
       new TextFormField(
          textCapitalization: TextCapitalization.words,
          decoration: new InputDecoration(
            border: UnderlineInputBorder(),
            filled: true,
            icon: Icon(Icons.person_pin_circle),
            hintText: 'Digite seu Estado',
            labelText: 'Estado',
          ),
          maxLength: 2,
          onSaved: (String val) {
            this.state = val;
          },
        ), 
        PasswordField(
            fieldKey: _passwordFieldKey,
            helperText: 'Digite uma password',
            labelText: 'password',
            onFieldSubmitted: (String val) {
              setState(() {
                this.password = val;
              });
            },
          ),
         new TextFormField(
            enabled: password != null && password.isNotEmpty,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              icon: Icon(Icons.vpn_key),
              filled: true,
              labelText: 'Digite a password novamente',
            ),
            onFieldSubmitted: (String val) {
              setState(() {
                passwordConfirm = val;
              });
            },
            maxLength: 8,
            obscureText: true,
          ),
        new SizedBox(height: 15.0),
        new RaisedButton(
          child: new Text('Cadastrar'),
          onPressed: _sendForm,
        )
      ],
    );
  }

  String _validarname(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o name";
    } else if (!regExp.hasMatch(value)) {
      return "O name deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String _validarCPF(String value) {
    String patttern = r'(^\d{3}\.\d{3}\.\d{3}\-\d{2}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o CPF";
    } else if (!regExp.hasMatch(value)) {
      return "O CPF deve conter apenas números";
    }
    return null;
  }

   String _validarData(String value) {
    String patttern = r'(^([0-2][0-9]|(3)[0-1])(\/)(((0)[0-9])|((1)[0-2]))(\/)\d{4}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe a data de nascimento";
    } else if (!regExp.hasMatch(value)) {
      return "A data de nascimento deve conter apenas números";
    }
    return null;
  } 

  String _validarCelular(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o celular";
    } else if(value.length != 10){
      return "O celular deve ter 10 dígitos";
    }else if (!regExp.hasMatch(value)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;
  }

  String _validarpassword(String value) {
    if(value.length != 10){
      return "A password deve no mínimo 6 dígitos";
    }
    return null;
  }

    String _validarpasswordConfirm(String value) {
    if(value != password){
      return "A password ser igual a password anterior";
    }
    return null;
  }

  String _validarEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inválido";
    }else {
      return null;
    }
  }

  _sendForm() async{
    // Sem erros na validação
    _key.currentState.save();
    print("name $name");
    print("Celular $phone");
    print("Email $email");
    print("CPF $cpf");
    print("Data de Nascimento $bithDate");
    print("Tipo Sanguineo $bloodType");
    print("Sexo $sex");
    print("password $password");
    print("password confirmada $passwordConfirm");

    print("========================TESTE CADASTRO ==========================");

  const url = 'https://easybloodteste.herokuapp.com/public/users';
  http.Response r = await http.post(url, headers: {"Content-Type": "application/json"}, body: json.encode({
      'cpf': cpf,
      'email': email,
      'name': name,
      'password': password,
      'bithDate': bithDate,
      'passwordConfirm': passwordConfirm,
      'username': name,
      'bloodType': bloodType,
      'phone': phone,
      'elegibleDonor': elegibleDonor,
      'address':{ 'state': state},
      'sex': sex
    }),);

  print(r.statusCode);
  print(r.body);

  if (r.statusCode == 201){
    print("Login Feito com sucesso");

    Navigator.of(context).pushNamed('/');
  }else{
    print("Erro ao realizar Cadastro");
  }

  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: new InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        icon: Icon(Icons.vpn_key),
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: new GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child:
              new Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}