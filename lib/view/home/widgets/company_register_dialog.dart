import 'package:desafio_flutter_ambisis/models/company.dart';
import 'package:desafio_flutter_ambisis/services/companies_service.dart';
import 'package:desafio_flutter_ambisis/utils/widgets/entry_text_field.dart';
import 'package:flutter/material.dart';

class CompanyRegisterDialog extends StatelessWidget {
  CompanyRegisterDialog({
    super.key,
    this.companyId,
    this.companyModel,
  });

  final String? companyId;
  final Company? companyModel;

  final CompaniesService companiesService = CompaniesService();

  final TextEditingController corporateNameController = TextEditingController();
  final TextEditingController cnpjController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController complementController = TextEditingController();

  _clearControllers() {
    corporateNameController.clear();
    cnpjController.clear();
    cepController.clear();
    cityController.clear();
    stateController.clear();
    districtController.clear();
    complementController.clear();
  }

  @override
  Widget build(BuildContext context) {
    if (companyModel != null) {
      corporateNameController.text = companyModel!.corporateName;
      cnpjController.text = companyModel!.cnpj;
      cepController.text = companyModel!.cep;
      cityController.text = companyModel!.city;
      stateController.text = companyModel!.state;
      districtController.text = companyModel!.district;
      complementController.text = companyModel!.complement;
    }

    return AlertDialog(
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Register Company'),
            EntryTextField(
              controller: corporateNameController,
              title: 'Corporate Name',
              isObscure: false,
            ),
            EntryTextField(
              controller: cnpjController,
              title: 'CNPJ',
              isObscure: false,
            ),
            EntryTextField(
              controller: cepController,
              title: 'Cep',
              isObscure: false,
            ),
            EntryTextField(
              controller: cityController,
              title: 'City',
              isObscure: false,
            ),
            EntryTextField(
              controller: stateController,
              title: 'State',
              isObscure: false,
            ),
            EntryTextField(
              controller: districtController,
              title: 'District',
              isObscure: false,
            ),
            EntryTextField(
              controller: complementController,
              title: 'Complement',
              isObscure: false,
            ),
            ElevatedButton(
              onPressed: () {
                Company company = Company(
                  corporateName: corporateNameController.text,
                  cnpj: cnpjController.text,
                  cep: cepController.text,
                  city: cityController.text,
                  state: stateController.text,
                  district: districtController.text,
                  complement: complementController.text,
                );
                if (companyId == null) {
                  companiesService.addCompany(company);
                } else {
                  companiesService.updateCompany(companyId!, company);
                }

                _clearControllers();

                Navigator.pop(context);
              },
              child: Text(companyId == null ? 'Register' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
