import 'package:trabalho_g1/response/response_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:trabalho_g1/client/api_client.dart';
import 'screens/locales.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Local',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const MyHomePage(title: 'Trabalho G1 - Consumo de API de Endereços'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<ResponseData> _buildBody(BuildContext context) {
    final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<ResponseData>(
      future: client.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final ResponseData? posts = snapshot.data;
          return posts == null
              ? const Text("Erro na requisição...")
              : _buildListView(context, posts);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildListView(BuildContext context, ResponseData posts) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(
              Icons.account_box,
              color: Colors.green,
              size: 50,
            ),
            title: Text(
              posts.data[index]['name'],
              style: const TextStyle(fontSize: 20),
            ),
            subtitle: Text(posts.data[index]['email']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.location_on),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapScreen(
                        lat: posts.data[index]['lat'],
                        lng: posts.data[index]['lng'],
                      ),
                    ),
                  );
                },
              ),
            ],
            ),
          ),
        );
      },
      itemCount: posts.data.length,
    );
  }
}
