// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_flutter_ambisis/models/company.dart';
import 'package:desafio_flutter_ambisis/services/companies_service.dart';
import 'package:desafio_flutter_ambisis/utils/widgets/section_title_text.dart';
import 'package:desafio_flutter_ambisis/view/company_details/widgets/licencies_list.dart';
import 'package:flutter/material.dart';

import 'widgets/add_licence_button.dart';
import 'widgets/company_info_row.dart';

class CompanyDetailsPage extends StatelessWidget {
  CompanyDetailsPage({super.key, required this.companyId});

  final String companyId;
  final CompaniesService companiesService = CompaniesService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: companiesService.getCompanyById(companyId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Company company = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text(company.corporateName),
            ),
            body: Column(
              children: [
                const SectionTitleText(text: 'Company Info'),
                CompanyInfoRow(
                  title: 'Cnpj',
                  info: company.cnpj,
                ),
                CompanyInfoRow(
                  title: 'Cep',
                  info: company.cep,
                ),
                CompanyInfoRow(
                  title: 'City',
                  info: company.cep,
                ),
                CompanyInfoRow(
                  title: 'State',
                  info: company.state,
                ),
                CompanyInfoRow(
                  title: 'District',
                  info: company.district,
                ),
                CompanyInfoRow(
                  title: 'Complement',
                  info: company.complement,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    const SectionTitleText(text: 'Licencies'),
                    AddCompanyButton(company: company),
                  ],
                ),
                LicenciesList(company: company),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Algo deu errado!",
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
