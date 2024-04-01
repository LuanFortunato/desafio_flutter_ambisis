// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Company {
  String corporateName;
  String cnpj;
  String cep;
  String city;
  String state;
  String district;
  String complement;

  Company({
    required this.corporateName,
    required this.cnpj,
    required this.cep,
    required this.city,
    required this.state,
    required this.district,
    required this.complement,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'corporateName': corporateName,
      'cnpj': cnpj,
      'cep': cep,
      'city': city,
      'state': state,
      'district': district,
      'complement': complement,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      corporateName: map['corporateName'] as String,
      cnpj: map['cnpj'] as String,
      cep: map['cep'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      district: map['district'] as String,
      complement: map['complement'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);
}
