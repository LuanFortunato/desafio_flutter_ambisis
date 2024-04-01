import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_flutter_ambisis/models/environmental_license.dart';
import 'package:desafio_flutter_ambisis/services/companies_service.dart';

class EnvironmentalLicenciesService {
  final CompaniesService companiesService = CompaniesService();

  final CollectionReference licencies = FirebaseFirestore.instance.collection(
    'licencies',
  );

  Future<void> addLicense(EnvironmentalLicense license) async {
    licencies.add((license.toMap()));
  }

  Stream<QuerySnapshot<Object?>> getAllLicenciesByCompany(
    String corporateName,
  ) {
    final licenciesStream = licencies
        .where(
          'company.corporateName',
          isEqualTo: corporateName,
        )
        .snapshots();
    return licenciesStream;
  }

  Future<void> updateLicense(String docId, EnvironmentalLicense license) {
    return licencies.doc(docId).update(license.toMap());
  }

  Future<void> deleteLicense(String docId) {
    return licencies.doc(docId).delete();
  }
}
