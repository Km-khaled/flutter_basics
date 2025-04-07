import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _grocerylist = [];
  var _isLoading = true;
  String? _errorMessage;
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
      'flutter-app-ec2b3-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        setState(() {
          _errorMessage = "Failed to fetch data. Please try again later.";
        });
      }
      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);
      final List<GroceryItem> loadedItems = [];

      for (final item in listData.entries) {
        final category =
            categories.entries
                .firstWhere((cat) => cat.value.title == item.value['category'])
                .value;
        loadedItems.add(
          GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: int.parse(item.value['quantity']),
            category: category,
          ),
        );
      }
      setState(() {
        _grocerylist = loadedItems;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _errorMessage = "Something went Wrong! Please try again later.";
      });
    }
  }

  void addItem() async {
    final newitem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (newitem == null) {
      return;
    }

    setState(() {
      _grocerylist.add(newitem);
    });
  }

  void removeItem(GroceryItem item) async {
    final index = _grocerylist.indexOf(item);
    setState(() {
      _grocerylist.remove(item);
    });

    final url = Uri.https(
      'flutter-app-ec2b3-default-rtdb.firebaseio.com',
      'shopping-list/${item.id}.json',
    );
    final response = await http.delete(url);
    if (response.statusCode != 200) {
      setState(() {
        _grocerylist.insert(index, item);
        _errorMessage = "Failed to delete item. Please try again later.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text("Empty Grocery Items Here!"));
    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }
    if (_grocerylist.isNotEmpty) {
      content = ListView.builder(
        itemCount: _grocerylist.length,
        itemBuilder:
            (context, index) => Dismissible(
              key: ValueKey(_grocerylist[index].id),
              onDismissed: (direction) {
                removeItem(_grocerylist[index]);
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: ListTile(
                title: Text(_grocerylist[index].name),
                trailing: Text(_grocerylist[index].quantity.toString()),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _grocerylist[index].category.color,
                ),
                onTap: () {},
              ),
            ),
      );
    }

    if (_errorMessage != null) {
      content = Center(child: Text(_errorMessage!));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [IconButton(onPressed: addItem, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
