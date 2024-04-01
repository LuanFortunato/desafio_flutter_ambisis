import 'package:desafio_flutter_ambisis/models/company.dart';

class EnvironmentalLicense {
  Company company;
  String number;
  String environmentalAgency;
  DateTime issuance;
  DateTime expiration;

  EnvironmentalLicense({
    required this.company,
    required this.number,
    required this.environmentalAgency,
    required this.issuance,
    required this.expiration,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'company': company.toMap(),
      'number': number,
      'environmentalAgency': environmentalAgency,
      'issuance': issuance.millisecondsSinceEpoch,
      'expiration': expiration.millisecondsSinceEpoch,
    };
  }

  factory EnvironmentalLicense.fromMap(Map<String, dynamic> map) {
    return EnvironmentalLicense(
      company: Company.fromMap(map['company'] as Map<String, dynamic>),
      number: map['number'] as String,
      environmentalAgency: map['environmentalAgency'] as String,
      issuance: DateTime.fromMillisecondsSinceEpoch(map['issuance'] as int),
      expiration: DateTime.fromMillisecondsSinceEpoch(map['expiration'] as int),
    );
  }
}
