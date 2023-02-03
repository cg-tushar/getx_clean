import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean/app/core/base_widgets/base_widget.dart';
import 'package:getx_clean/domain/core/state_handler/state_controller.dart';
import 'package:getx_clean/presentation/home/controllers/article.controller.dart';
import 'package:getx_clean/presentation/home/controllers/everything.controller.dart';

import '../../domain/core/state_handler/state_builder_widget.dart';
import '../../infrastructure/dal/daos/news_model.dart';

class HomeScreen extends GetView<ArticleController> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      title: "HomePage",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          ElevatedButton(
            onPressed: controller.clearLocalStorage,
            child: const Text("Remove all cache"),
          ),
          Expanded(
            child: SuperStateBuilder<ArticleController, NewsModel>(
              child: (p0) {
                return ListView.builder(
                  itemCount: p0?.data?.articles?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.green[100]!.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            p0?.data?.articles?[index].title ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Chip(label: Text(p0?.data?.articles?[index].author ?? '')),
                          const Divider(),
                          Text(p0?.data?.articles?[index].content ?? ""),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Divider(
            color: Colors.red,
            thickness: 10,
          ),
          Expanded(
            child: SuperStateBuilder<EverythingController, NewsModel>(
              child: (p0) {
                return ListView.builder(
                  itemCount: p0?.data?.articles?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.green[100]!.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            p0?.data?.articles?[index].title ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Chip(label: Text(p0?.data?.articles?[index].author ?? '')),
                          const Divider(),
                          Text(p0?.data?.articles?[index].content ?? ""),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
