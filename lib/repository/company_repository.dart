import 'package:getx_test_flutter/models/company_model.dart';
import 'package:getx_test_flutter/utils/custom_dio.dart';

class CompanyRepository {
  Future<List<CompanyModel>> getCompanies() async {
    final dio = CustomDio().instance;

    await Future.delayed(Duration(seconds: 1));

    return dio.get('/companies').then((res) => res.data['companies']
            ['companies']
        .map<CompanyModel>((c) => CompanyModel.fromJson(c))
        .toList());
  }

  Future<CompanyModel> getCompany(String id) async {
    final dio = CustomDio().instance;

    final response = await dio.get('/companies/$id');
    CompanyModel company = CompanyModel.fromJson(response.data['company']);
    return company;
  }

  Future createCompany(String name, String email) async {
    final dio = CustomDio().instance;
    final bodyData = {'name': name, 'email': email};

    return dio.post('/companies/', data: bodyData);
  }

  Future updateCompany(String id, String name, String email) async {
    final dio = CustomDio().instance;
    final bodyData = {'name': name, 'email': email};

    return dio.put('/companies/$id', data: bodyData);
  }

  Future deleteCompany(String id) {
    final dio = CustomDio().instance;

    return dio.delete('/companies/$id');
  }
}
