// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Product>.from(jsonData.map((x) => Product.fromJson(x)));
}

String productToJson(List<Product> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Product {
  List<dynamic> historia;
  String id;
  String riviId;
  String nro;
  String nimi;
  String valmistaja;
  String pullokoko;
  String hinta;
  String litrahinta;
  String hinnastojarjestys;
  String tyyppi;
  String valmistusmaa;
  String alue;
  String etikettimerkintoja;
  String luonnehdinta;
  PackageType pakkaustyyppi;
  String suljentatyyppi;
  String alkoholi;
  String hapotGL;
  String sokeriGL;
  String energia;
  Selection valikoima;
  String pvm;
  String vuosikerta;
  String huomautus;
  String rypaleet;
  String oluttyyppi;
  String kantavierrep;
  String vari;
  String katkerot;
  String erityisryhma;
  String uutuus;

  Product({
    this.historia,
    this.id,
    this.riviId,
    this.nro,
    this.nimi,
    this.valmistaja,
    this.pullokoko,
    this.hinta,
    this.litrahinta,
    this.hinnastojarjestys,
    this.tyyppi,
    this.valmistusmaa,
    this.alue,
    this.etikettimerkintoja,
    this.luonnehdinta,
    this.pakkaustyyppi,
    this.suljentatyyppi,
    this.alkoholi,
    this.hapotGL,
    this.sokeriGL,
    this.energia,
    this.valikoima,
    this.pvm,
    this.vuosikerta,
    this.huomautus,
    this.rypaleet,
    this.oluttyyppi,
    this.kantavierrep,
    this.vari,
    this.katkerot,
    this.erityisryhma,
    this.uutuus,
  });

  factory Product.fromJson(Map<String, dynamic> json) => new Product(
        historia: json["historia"] == null
            ? null
            : new List<dynamic>.from(json["historia"].map((x) => x)),
        id: json["_id"] == null ? null : json["_id"],
        riviId: json["rivi_id"] == null ? null : json["rivi_id"],
        nro: json["nro"] == null ? null : json["nro"],
        nimi: json["nimi"] == null ? null : json["nimi"],
        valmistaja: json["valmistaja"] == null ? null : json["valmistaja"],
        pullokoko: json["pullokoko"] == null ? null : json["pullokoko"],
        hinta: json["hinta"] == null ? null : json["hinta"],
        litrahinta: json["litrahinta"] == null ? null : json["litrahinta"],
        hinnastojarjestys: json["hinnastojärjestys"] == null
            ? null
            : json["hinnastojärjestys"],
        tyyppi: json["tyyppi"] == null ? null : json["tyyppi"],
        valmistusmaa:
            json["valmistusmaa"] == null ? null : json["valmistusmaa"],
        alue: json["alue"] == null ? null : json["alue"],
        etikettimerkintoja: json["etikettimerkintöjä"] == null
            ? null
            : json["etikettimerkintöjä"],
        luonnehdinta:
            json["luonnehdinta"] == null ? null : json["luonnehdinta"],
        pakkaustyyppi: json["pakkaustyyppi"] == null
            ? null
            : packageTypeValues.map[json["pakkaustyyppi"]],
        suljentatyyppi:
            json["suljentatyyppi"] == null ? null : json["suljentatyyppi"],
        alkoholi: json["alkoholi-%"] == null ? null : json["alkoholi-%"],
        hapotGL: json["hapot g/l"] == null ? null : json["hapot g/l"],
        sokeriGL: json["sokeri g/l"] == null ? null : json["sokeri g/l"],
        energia: json["energia"] == null ? null : json["energia"],
        valikoima: json["valikoima"] == null
            ? null
            : selectionValues.map[json["valikoima"]],
        pvm: json["pvm"] == null ? null : json["pvm"],
        vuosikerta: json["vuosikerta"] == null ? null : json["vuosikerta"],
        huomautus: json["huomautus"] == null ? null : json["huomautus"],
        rypaleet: json["rypäleet"] == null ? null : json["rypäleet"],
        oluttyyppi: json["oluttyyppi"] == null ? null : json["oluttyyppi"],
        kantavierrep:
            json["kantavierrep-%"] == null ? null : json["kantavierrep-%"],
        vari: json["väri"] == null ? null : json["väri"],
        katkerot: json["katkerot"] == null ? null : json["katkerot"],
        erityisryhma:
            json["erityisryhmä"] == null ? null : json["erityisryhmä"],
        uutuus: json["uutuus"] == null ? null : json["uutuus"],
      );

  Map<String, dynamic> toJson() => {
        "historia": historia == null
            ? null
            : new List<dynamic>.from(historia.map((x) => x)),
        "_id": id == null ? null : id,
        "rivi_id": riviId == null ? null : riviId,
        "nro": nro == null ? null : nro,
        "nimi": nimi == null ? null : nimi,
        "valmistaja": valmistaja == null ? null : valmistaja,
        "pullokoko": pullokoko == null ? null : pullokoko,
        "hinta": hinta == null ? null : hinta,
        "litrahinta": litrahinta == null ? null : litrahinta,
        "hinnastojärjestys":
            hinnastojarjestys == null ? null : hinnastojarjestys,
        "tyyppi": tyyppi == null ? null : tyyppi,
        "valmistusmaa": valmistusmaa == null ? null : valmistusmaa,
        "alue": alue == null ? null : alue,
        "etikettimerkintöjä":
            etikettimerkintoja == null ? null : etikettimerkintoja,
        "luonnehdinta": luonnehdinta == null ? null : luonnehdinta,
        "pakkaustyyppi": pakkaustyyppi == null
            ? null
            : packageTypeValues.reverse[pakkaustyyppi],
        "suljentatyyppi": suljentatyyppi == null ? null : suljentatyyppi,
        "alkoholi-%": alkoholi == null ? null : alkoholi,
        "hapot g/l": hapotGL == null ? null : hapotGL,
        "sokeri g/l": sokeriGL == null ? null : sokeriGL,
        "energia": energia == null ? null : energia,
        "valikoima":
            valikoima == null ? null : selectionValues.reverse[valikoima],
        "pvm": pvm == null ? null : pvm,
        "vuosikerta": vuosikerta == null ? null : vuosikerta,
        "huomautus": huomautus == null ? null : huomautus,
        "rypäleet": rypaleet == null ? null : rypaleet,
        "oluttyyppi": oluttyyppi == null ? null : oluttyyppi,
        "kantavierrep-%": kantavierrep == null ? null : kantavierrep,
        "väri": vari == null ? null : vari,
        "katkerot": katkerot == null ? null : katkerot,
        "erityisryhmä": erityisryhma == null ? null : erityisryhma,
        "uutuus": uutuus == null ? null : uutuus,
      };
}

enum PackageType { MUOVIPULLO, PULLO, TLKKI, HANAPAKKAUS }

final packageTypeValues = new EnumValues({
  "hanapakkaus": PackageType.HANAPAKKAUS,
  "muovipullo": PackageType.MUOVIPULLO,
  "pullo": PackageType.PULLO,
  "tölkki": PackageType.TLKKI
});

enum Selection { VAKIOVALIKOIMA, TILAUSVALIKOIMA, ERIKOISERA }

final selectionValues = new EnumValues({
  "erikoiserä": Selection.ERIKOISERA,
  "tilausvalikoima": Selection.TILAUSVALIKOIMA,
  "vakiovalikoima": Selection.VAKIOVALIKOIMA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
