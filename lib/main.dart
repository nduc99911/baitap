import 'package:baitap/controller/Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Home1(),
    );
  }
}


class Home1 extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  var dulieu = '';
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bài tập'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (String value) {
                dulieu = value;
              },
              decoration: InputDecoration(
                
                border: OutlineInputBorder(),
                labelText: 'Nhập',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {
                  controller.add(dulieu);
                  print(controller.strings.length);
                },
                child: Text('Thêm Dữ Liệu')),
          ),
          // Obx(() => Text('Số lượng ${controller.strings.length}')),
          // Obx(() => Column(
          //       children: [for (var item in controller.strings) Text(item)],
          //     ))
          Expanded(
              child: Obx(() => ListView.builder(
                  itemCount: controller.strings.length,
                  itemBuilder: (BuildContext context, int i) {
                    return _buildRow(i);
                  }))),
        ],
      ),
    );
  }

  Widget _buildRow(int idx) {
    return ListTile(
      title: Text('Item add: ${controller.strings[idx]}'),
      trailing: const Icon(Icons.dashboard),
    );
  }
}
