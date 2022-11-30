import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean/app/core/base_widgets/base_widget.dart';
import '../../domain/core/state_handler/state_builder_widget.dart';
import '../../domain/core/state_handler/state_controller.dart';
import '../../infrastructure/dal/daos/news_model.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SuperStateBuilder<HomeController>(
                child: (p0) {
                  return ElevatedButton(
                    onPressed: () {
                      controller.call1();
                    },
                    child: const Text("Another api call"),
                  );
                },
                call: NetworkCall.one,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.removeCache();
                },
                child: const Text("Remove all cache"),
              )
            ],
          ),
          Expanded(
            child: SuperStateBuilder<HomeController>(
              child: (p0) {
                final data = p0?.data as NewsModel?;
                print(data);
                return ListView.builder(
                  itemCount: data?.articles?.length,
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
                            data?.articles?[index].title ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          Text(data?.articles?[index].content ?? ""),
                        ],
                      ),
                    );
                  },
                );
              },
              call: NetworkCall.three,
            ),
          ),
        ],
      ),
    );
  }
}
