import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_flutter_ambisis/models/company.dart';
import 'package:desafio_flutter_ambisis/services/companies_service.dart';
import 'package:desafio_flutter_ambisis/view/company_details/company_details_page.dart';
import 'package:flutter/material.dart';

import 'company_register_dialog.dart';

class CompaniesList extends StatelessWidget {
  CompaniesList({super.key});

  final CompaniesService companiesService = CompaniesService();

  void _updateCompany(context, String companyId, Company company) {
    showDialog(
      context: context,
      builder: (context) {
        return CompanyRegisterDialog(
          companyId: companyId,
          companyModel: company,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: companiesService.getAllCompanies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List companiesList = snapshot.data!.docs;
          return Expanded(
            child: ListView.separated(
              itemCount: companiesList.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                  indent: 15,
                  endIndent: 15,
                );
              },
              itemBuilder: (context, index) {
                DocumentSnapshot doc = companiesList[index];
                Company company = Company.fromMap(
                  doc.data() as Map<String, dynamic>,
                );

                return ListTile(
                  title: Text(company.corporateName),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        iconSize: 18,
                        onPressed: () {
                          _updateCompany(context, doc.id, company);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        iconSize: 18,
                        onPressed: () {
                          companiesService.deleteCompany(doc.id);
                        },
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompanyDetailsPage(
                          companyId: doc.id,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        } else {
          return const Text('No companies found!');
        }
      },
    );
  }
}
