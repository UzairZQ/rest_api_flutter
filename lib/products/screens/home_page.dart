import 'package:flutter/material.dart';
import 'package:rest_api_project/products/services/services_product.dart';
import 'package:rest_api_project/products/utilities/app_assets.dart';
import 'package:rest_api_project/products/utilities/rest_api_utils.dart';
import '../model/model_post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Welcome>>? _future_list;

  @override
  void initState() {
    _future_list = ServiceProduct.LoadProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API APP"),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          future: _future_list,
          builder: (context, AsyncSnapshot<List<Welcome>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: RestApiUtilities.ShowLoadingView(context),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  snapshot.error.toString(),
                  style: TextStyle(fontSize: 20),
                ));
              } else if (snapshot.hasData) {
                List<Welcome> list = snapshot.data!;

                if (list.isNotEmpty) {
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('${list[index].title}'),
                          subtitle: Text('${list[index].description}'),
                        );
                      });
                } else {
                  return RestApiUtilities.ShowMessageView(context, AppAsset.loadingErrorView, 'Sorry No record Found');
                }
              }
            } else {
              return const SizedBox();
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
