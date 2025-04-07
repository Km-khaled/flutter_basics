import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _GroceryList = [];

  void addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem()));

    if (newItem == null) {
      return;
    } else {
      setState(() {
        _GroceryList.add(newItem);
      });
    }
  }

  void removeItem(GroceryItem item) {
    int index = _GroceryList.indexOf(item);
    setState(() {
      _GroceryList.remove(item);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${item.name} removed from the list!"),
        duration: const Duration(seconds: 2),

        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _GroceryList.insert(index, item);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text("Empty Grocery Items Here!"));

    if (_GroceryList.isNotEmpty) {
      content = ListView.builder(
        itemCount: _GroceryList.length,
        itemBuilder:
            (context, index) => Dismissible(
              key: ValueKey(_GroceryList[index].id),
              onDismissed: (direction) {
                removeItem(_GroceryList[index]);
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: ListTile(
                title: Text(_GroceryList[index].name),
                trailing: Text(_GroceryList[index].quantity.toString()),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _GroceryList[index].category.color,
                ),
                onTap: () {},
              ),
            ),
      );
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
