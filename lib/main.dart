import 'package:flutter/material.dart';

void main() {
  runApp(
    const DaftarMimpi(),
  );
}

class DaftarMimpi extends StatelessWidget {
  const DaftarMimpi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dream',
      home: Utama(),
    );
  }
}

class Daftar extends StatelessWidget {
  const Daftar({
    required this.text,
    Key? key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: const Icon(Icons.favorite),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: Theme.of(context).textTheme.headline6),
            ],
          ),
        ],
      ),
    );
  }
}

class Utama extends StatefulWidget {
  const Utama({
    Key? key,
  }) : super(key: key);

  @override
  State<Utama> createState() => _InputDaftar();
}

class _InputDaftar extends State<Utama> {
  final List<Daftar> _mimpi = [];
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _handleSubmitted(String text) {
    _textController.clear();
    var mimpi = Daftar(
      text: text,
    );
    setState(() {
      _mimpi.insert(0, mimpi);
    });
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dream come True')),
      backgroundColor: Colors.pink[200],
      drawerScrimColor: Colors.yellow,
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, index) => _mimpi[index],
              itemCount: _mimpi.length,
            ),
          ),
          const Divider(height: 1.0),
          Container(
            child: _buildTextComposer(),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(
                    hintText: 'Insert Your Dream'),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }
}
