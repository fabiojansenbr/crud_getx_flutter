import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_flutter/controllers/company_controller.dart';
import 'package:getx_test_flutter/models/company_model.dart';
import 'package:getx_test_flutter/utils/loader.dart';
import 'package:getx_test_flutter/utils/text_widget.dart';

class CompaniesPage extends StatelessWidget {
  final companiesController = Get.put(CompanyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Companies'),
        ),
        body: GetX<CompanyController>(
          initState: (_) {
            companiesController.listar();
          },
          init: CompanyController(),
          builder: (api) {
            var companies = api.companies;

            if (companiesController.carregando.value == true)
              return Loader(
                msg: 'Carregando',
                color: Colors.red,
              );

            if (companies.length == 0) {
              return Center(
                child: TextWidget(text: 'Companies not found.', fontSize: null),
              );
            }

            return ListView.builder(
              itemCount: companies.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => {
                    Get.toNamed('/company-edit/${companies[index].id}'),
                  },
                  child: ListTile(
                    title: Text(companies[index].name),
                  ),
                );
              },
            );
          },
        ));
  }
}
