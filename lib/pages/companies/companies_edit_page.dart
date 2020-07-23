import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_flutter/controllers/company_controller.dart';
import 'package:getx_test_flutter/models/company_model.dart';
import 'package:getx_test_flutter/utils/loader.dart';

class CompaniesEditPage extends StatelessWidget {
  final companiesController = Get.put(CompanyController());
  get companyId => Get.parameters["id"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Editar empresa'),
        ),
        body: GetBuilder<CompanyController>(
          initState: (_) {
            companiesController.listarCompany(companyId);
          },
          builder: (api) {
            var company = api.company;

            if (companiesController.carregando.value == true) {
              return Loader(
                msg: 'Carregando',
                color: Colors.red,
              );
            }
            return _buildForm(company);
          },
        ));
  }

  Widget _buildForm(Rx<CompanyModel> company) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: companiesController.formKey,
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: TextFormField(
                    initialValue: company.value.name,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                    ),
                    //onChanged: controller.setName,
                    onSaved: companiesController.setName,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: TextFormField(
                    initialValue: company.value.email,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                    ),
                    //onChanged: controller.setEmail,
                    onSaved: companiesController.setEmail,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Campo obrigatório';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: RaisedButton(
                  child: Text('Salvar'),
                  onPressed: () async {
                    companiesController.atualizar(company.value.id);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
