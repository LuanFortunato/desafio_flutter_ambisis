// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:desafio_flutter_ambisis/models/company.dart';

import 'licence_register_dialog.dart';

class AddCompanyButton extends StatelessWidget {
  const AddCompanyButton({
    super.key,
    required this.company,
  });

  final Company company;

  void addCompany(context) {
    showDialog(
      context: context,
      builder: (context) {
        return LicenseRegisterDialog(company: company);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () => addCompany(context),
    );
  }
}
