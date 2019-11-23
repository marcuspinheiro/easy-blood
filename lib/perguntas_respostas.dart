import 'package:flutter/material.dart';
import 'login_front.dart';

class Perguntas extends StatefulWidget {
  @override
  _PerguntasState createState() => _PerguntasState();
}

class _PerguntasState extends State<Perguntas> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Perguntas e respostas"),
      ),
            body: Container(
        child: Column(
          children: <Widget>[
                ListTile(
                title: Text('Tenho que fazer exames antes para poder doar sangue?', style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono' ),),
                subtitle: Text('Não é necessário, pois no dia da doação você irá passar por uma avaliação(triagem) e estando apto a doação serão colhidos também os exames de sorologia. Por isso a importância da sinceridade das respostas nesse momento.', style: TextStyle(fontSize: 18, fontFamily: 'RobotoMono')),
               dense: true,
              ),
              ListTile(
                title: Text('Quais os medicamentos que impedem a doação?', style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono' )),
                subtitle: Text('Esclarecemos que não é viável para o Hemocentro estar disponibilizando esta lista devido a grande variação de normas para medicamentos e a quantidade de medicamentos postos no mercado constantemente. O ideal é que o doador entre em contato conosco por telefone ou pessoalmente sempre que estiver fazendo uso de medicamentos.', style: TextStyle(fontSize: 18, fontFamily: 'RobotoMono')),
               dense: true,
              ),
              ListTile(
                title: Text('A doação de sangue afina ou engrossa o sangue?', style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono' )),
                subtitle: Text('A doação de sangue não afina nem engrossa o sangue. Após a doação, existe a reposição do volume e componentes do sangue pelo próprio organismo até atingir um equilíbrio existente antes da doação.', style: TextStyle(fontSize: 18, fontFamily: 'RobotoMono')),
               dense: true,
              ),
              ListTile(
                title: Text('É necessário jejum para doar sangue?', style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono' )),
                subtitle: Text('O candidato não pode estar em jejum! No entanto, ele não deve ter ingerido alimentos gordurosos (como “bacon”, ovos, feijoada, etc.) e após o almoço, aguardar pelo menos 3 horas para doação', style: TextStyle(fontSize: 18, fontFamily: 'RobotoMono')),
               dense: true,
              ),
              ListTile(
                title: Text('O que acontece se for encontrado algum exame laboratorial alterado na doação', style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono' )),
                subtitle: Text('Nesse caso, o candidato será convocado para comparecer ao Hemocentro para ser orientado sobre o significado desse exame e ser encaminhado para atendimento médico especializado quando for o caso.', style: TextStyle(fontSize: 18, fontFamily: 'RobotoMono')),
               dense: true,
              ),
              ListTile(
                title: Text('Quais os benefícios do doador de sangue?', style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono' )),
                subtitle: Text('Em nosso país, é proibida por lei a gratificação direta ou indireta para a doação de sangue. Na verdade, o “benefício” que o doador recebe é saber que está colaborando para estoques de sangue de qualidade para atender a toda a comunidade, lembrando-se que qualquer um pode vir a precisar de sangue, principalmente nas urgências.', style: TextStyle(fontSize: 18, fontFamily: 'RobotoMono')),
               dense: true,
              ),
          ],
        ),
      ),
     
    );
  }
}