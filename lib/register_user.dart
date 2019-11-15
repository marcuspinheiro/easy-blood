import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {

  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String nome, email, phone, cpf, data, bloodType, sex, senha, confsenha;

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
          decoration: new InputDecoration(hintText: 'Nome Completo'),
          maxLength: 40,
          validator: _validarNome,
          onSaved: (String val) {
            nome = val;
          },
        ),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'CPF'),
          maxLength: 14,
          validator: _validarCPF,
          onSaved: (String val) {
            cpf = val;
          },
        ),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Data de Nascimento'),
            keyboardType: TextInputType.datetime,
            maxLength: 10,
            validator: _validarData,
            onSaved: (String val) {
              data = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Celular'),
            keyboardType: TextInputType.phone,
            maxLength: 10,
            validator: _validarCelular,
            onSaved: (String val) {
              phone = val;
            }),
        new TextFormField(
            decoration: new InputDecoration(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            maxLength: 40,
            validator: _validarEmail,
            onSaved: (String val) {
              email = val;
            }),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Tipo Sanguíneo'),
          maxLength: 3,
          onSaved: (String val) {
            bloodType = val;
          },
        ),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Sexo'),
          maxLength: 1,
          onSaved: (String val) {
            sex = val;
          },
        ),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Senha'),
          maxLength: 12,
          obscureText: true,
          validator: _validarSenha,
          onSaved: (String val) {
            senha = val;
          },
        ),
        new TextFormField(
          decoration: new InputDecoration(hintText: 'Confirmar Senha'),
          maxLength: 12,
          obscureText: true,
          validator: _validarConfSenha,
          onSaved: (String val) {
            confsenha = val;
          },
        ),
        new SizedBox(height: 15.0),
        new RaisedButton(
          child: new Text('Enviar'),
          onPressed: _sendForm,
        )
      ],
    );
  }

  String _validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
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

  String _validarSenha(String value) {
    if(value.length != 10){
      return "A senha deve no mínimo 6 dígitos";
    }
    return null;
  }

    String _validarConfSenha(String value) {
    if(value != senha){
      return "A senha ser igual a senha anterior";
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
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      print("Nome $nome");
      print("Celular $phone");
      print("Email $email");
      print("CPF $cpf");
      print("Data de Nascimento $data");
      print("Tipo Sanguineo $bloodType");
      print("Sexo $sex");
      print("Senha $senha");
      print("Senha confirmada $confsenha");

      print("========================TESTE CADASTRO ==========================");


  http.Response r = await http.post('https://easybloodteste.herokuapp.com/public/users');
  
  print(r.statusCode);
  print(r.body);

if (r.statusCode == 200){
  print("Cadastro feito com sucesso");

  Navigator.of(context).pushNamed('/login_front');
}else{
  print("Erro ao cadastrar");
}

    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }
}