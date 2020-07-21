import 'package:get/get.dart';
import 'package:getx_test_flutter/models/company_model.dart';
import 'package:getx_test_flutter/repository/company_repository.dart';

class CompanyController extends GetxController {
  CompanyRepository repository = CompanyRepository();
  RxBool carregando = false.obs;

  final _companies = List<CompanyModel>().obs;
  List<CompanyModel> get companies => this._companies.value;
  set companies(List<CompanyModel> value) => this._companies.value = value;

  listar() async {
    carregando.value = true;
    final response = await repository.getCompanies();
    companies = response;
    carregando.value = false;
  }
}
