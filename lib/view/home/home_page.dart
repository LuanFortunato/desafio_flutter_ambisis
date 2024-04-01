import 'package:desafio_flutter_ambisis/view/home/widgets/add_company_button.dart';
import 'package:desafio_flutter_ambisis/view/home/widgets/companies_list.dart';
import 'package:desafio_flutter_ambisis/view/home/widgets/sign_out_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Companies'),
        actions: const [
          AddCompanyButton(),
        ],
      ),
      body: Column(
        children: [
          CompaniesList(),
          const SignOutButton(),
        ],
      ),
    );
  }
}
