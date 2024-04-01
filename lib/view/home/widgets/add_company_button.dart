import 'package:flutter/material.dart';

import 'company_register_dialog.dart';

class AddCompanyButton extends StatelessWidget {
  const AddCompanyButton({super.key});

  void addCompany(context) {
    showDialog(
      context: context,
      builder: (context) {
        return CompanyRegisterDialog();
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
