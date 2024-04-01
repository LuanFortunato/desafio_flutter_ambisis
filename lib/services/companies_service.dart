import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_flutter_ambisis/models/company.dart';

class CompaniesService {
  final CollectionReference companies = FirebaseFirestore.instance.collection(
    'companies',
  );

  Future<void> addCompany(Company company) async {
    companies.add((company.toMap()));
  }

  Future<Company> getCompanyById(String companyId) async {
    final company = await companies.doc(companyId).get().then((c) => c.data());
    return Company.fromMap(company as Map<String, dynamic>);
  }

  Stream<QuerySnapshot> getAllCompanies() {
    final companiesStream = companies.orderBy('corporateName').snapshots();
    return companiesStream;
  }

  Future<void> updateCompany(String docId, Company company) {
    return companies.doc(docId).update(company.toMap());
  }

  Future<void> deleteCompany(String docId) {
    return companies.doc(docId).delete();
  }
}
