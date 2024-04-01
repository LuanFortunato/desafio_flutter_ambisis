import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafio_flutter_ambisis/models/company.dart';
import 'package:desafio_flutter_ambisis/models/environmental_license.dart';
import 'package:desafio_flutter_ambisis/services/environmental_licencies_service.dart';
import 'package:flutter/material.dart';

import 'licence_register_dialog.dart';

class LicenciesList extends StatelessWidget {
  LicenciesList({super.key, required this.company});

  final Company company;

  final EnvironmentalLicenciesService licenciesService =
      EnvironmentalLicenciesService();

  void _updateLicense(context, String licenseId, EnvironmentalLicense license) {
    showDialog(
      context: context,
      builder: (context) {
        return LicenseRegisterDialog(
          licenseId: licenseId,
          licenseModel: license,
          company: company,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: licenciesService.getAllLicenciesByCompany(company.corporateName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List licenciesList = snapshot.data!.docs;
          return Expanded(
            child: ListView.separated(
              itemCount: licenciesList.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                  indent: 15,
                  endIndent: 15,
                );
              },
              itemBuilder: (context, index) {
                DocumentSnapshot doc = licenciesList[index];
                EnvironmentalLicense license = EnvironmentalLicense.fromMap(
                  doc.data() as Map<String, dynamic>,
                );

                return ListTile(
                  title: Text(license.number),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        iconSize: 18,
                        onPressed: () {
                          _updateLicense(context, doc.id, license);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        iconSize: 18,
                        onPressed: () {
                          licenciesService.deleteLicense(doc.id);
                        },
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return const Text('No licencies found!');
        }
      },
    );
  }
}
