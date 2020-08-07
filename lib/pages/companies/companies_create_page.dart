import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_test_flutter/controllers/company_controller.dart';
import 'package:getx_test_flutter/models/company_model.dart';
import 'package:getx_test_flutter/utils/loader.dart';

class CompaniesCreatePage extends StatelessWidget {
  final companiesController = Get.put(CompanyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Editar empresa'),
        ),
        body: GetX<CompanyController>(
          builder: (api) {
            var company = api.company;

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
                child: companiesController.carregando.value == true
                    ? Loader(
                        msg: 'Carregando',
                      )
                    : RaisedButton(
                        child: Text('Salvar'),
                        onPressed: () async {
                          companiesController.criar();
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
