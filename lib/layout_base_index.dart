new Material(
  borderRadius: new BorderRadius.circular(6.0),
  elevation: 2.0,
  child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Adicionamos aqui FadeInImage que é uma variande do widget Image. Ela nos possibilita carregar image de uma URL
          new FadeInImage.assetNetwork(
            placeholder: '',
            image: _img,
            fit: BoxFit.cover,
            width: 95.0,
            height: 95.0
          ),
          new Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_title),
              new Text(_date),
              new Text(_description)],
          )
        ],
      ),
  )
