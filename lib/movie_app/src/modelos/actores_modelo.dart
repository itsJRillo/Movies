class Cast{


  List<Actor> actores = new List();


  Cast.fromJsonList( List<dynamic> jsonList){

    if( jsonList == null) return ;

    jsonList.forEach((item){

      final actor = Actor.fromJsonMap(item);
      actores.add(actor);

    });

  }

 }





class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> json){

    castId      = json["cast_id"];
    character   = json["character"];
    creditId    = json["credit_id"];
    gender      = json["gender"];
    id          = json["id"];
    name        = json["name"];
    order       = json["order"];
    profilePath = json["profile_path"];

  }


   getPhoto() {
    if (profilePath == null) {
      return "data:image/png;base64,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";
    } else {
      return "https://image.tmdb.org/t/p/w500/$profilePath";
    }
  }

}

