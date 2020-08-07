import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_flutter/controllers/company_controller.dart';
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
      body: GetBuilder<CompanyController>(
        assignId: true,
        initState: (_) {
          companiesController.listar();
        },
        init: CompanyController(),
        autoRemove: true,
        builder: (api) {
          var companies = api.companies;

          if (companiesController.carregando.value == true) {
            return Loader(
              msg: 'Carregando',
              color: Colors.red,
            );
          }
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
                  Get.toNamed('/company/edit/${companies[index].id}'),
                },
                child: Dismissible(
                  key: UniqueKey(),
                  child: ListTile(
                    leading: Text(
                      companies[index].name[0].toUpperCase(),
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    title: Text(companies[index].name),
                    subtitle: Text(companies[index].email),
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      companiesController.deletar(companies[index].id);
                    }
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => {
          Get.toNamed('/company/create/'),
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
