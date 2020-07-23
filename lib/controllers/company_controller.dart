import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_test_flutter/models/company_model.dart';
import 'package:getx_test_flutter/repository/company_repository.dart';

class CompanyController extends GetxController {
  CompanyRepository repository = CompanyRepository();
  RxBool carregando = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _companies = List<CompanyModel>().obs;
  List<CompanyModel> get companies => this._companies.value;
  set companies(List<CompanyModel> value) => this._companies.value = value;

  var company = CompanyModel().obs;

  RxString name = ''.obs;

  RxString email = ''.obs;

  setName(String value) => name.value = value;

  setEmail(String value) => email.value = value;

  listar() async {
    carregando.value = true;
    final response = await repository.getCompanies();
    companies = response;
    carregando.value = false;
    update();
  }

  listarCompany(String id) async {
    carregando.value = true;

    final response = await repository.getCompany(id);
    company.value = response;

    carregando.value = false;
    update();
  }

  atualizar(String id) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      await repository.updateCompany(id, name.value, email.value);

      Get.back();
      listar();
    }
  }
}
