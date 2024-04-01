import 'package:desafio_flutter_ambisis/models/company.dart';
import 'package:desafio_flutter_ambisis/models/environmental_license.dart';
import 'package:desafio_flutter_ambisis/services/environmental_licencies_service.dart';
import 'package:desafio_flutter_ambisis/utils/widgets/entry_text_field.dart';
import 'package:flutter/material.dart';

class LicenseRegisterDialog extends StatefulWidget {
  const LicenseRegisterDialog({
    super.key,
    this.licenseId,
    this.licenseModel,
    required this.company,
  });

  final String? licenseId;
  final EnvironmentalLicense? licenseModel;
  final Company company;

  @override
  State<LicenseRegisterDialog> createState() => _LicenseRegisterDialogState();
}

class _LicenseRegisterDialogState extends State<LicenseRegisterDialog> {
  final EnvironmentalLicenciesService licenseService =
      EnvironmentalLicenciesService();

  final TextEditingController numberController = TextEditingController();

  final TextEditingController environmentalAgencyController =
      TextEditingController();

  final TextEditingController issuanceController = TextEditingController();

  final TextEditingController expirationController = TextEditingController();

  _clearControllers() {
    numberController.clear();
    environmentalAgencyController.clear();
    issuanceController.clear();
    expirationController.clear();
  }

  Future<void> _selectDate(context, controller) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        controller.text = date.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.licenseModel != null) {
      numberController.text = widget.licenseModel!.number;
      environmentalAgencyController.text =
          widget.licenseModel!.environmentalAgency;
    }
    return AlertDialog(
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Register Company'),
            EntryTextField(
              controller: numberController,
              title: 'Number',
              isObscure: false,
            ),
            EntryTextField(
              controller: environmentalAgencyController,
              title: 'Environmental Agency',
              isObscure: false,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Issuance Date',
                prefixIcon: Icon(
                  Icons.calendar_month,
                ),
              ),
              readOnly: true,
              controller: issuanceController,
              onTap: () => _selectDate(context, issuanceController),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Expiration Date',
                prefixIcon: Icon(
                  Icons.calendar_month,
                ),
              ),
              readOnly: true,
              controller: expirationController,
              onTap: () => _selectDate(context, expirationController),
            ),
            ElevatedButton(
              onPressed: () {
                EnvironmentalLicense license = EnvironmentalLicense(
                  company: widget.company,
                  number: numberController.text,
                  environmentalAgency: environmentalAgencyController.text,
                  issuance: DateTime.parse(issuanceController.text),
                  expiration: DateTime.parse(expirationController.text),
                );
                if (widget.licenseId == null) {
                  licenseService.addLicense(license);
                } else {
                  licenseService.updateLicense(widget.licenseId!, license);
                }

                _clearControllers();

                Navigator.pop(context);
              },
              child: Text(widget.licenseId == null ? 'Register' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
