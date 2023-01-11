import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final dynamic id;
  final dynamic productId;
  final dynamic price;
  final int quantity;
  final String title;
  final String image;

  const CartItem(this.id, this.productId, this.price, this.quantity, this.title,
      this.image,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text(
              'Do you want to remove the item from the cart?',
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            height: 80,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child: Image.network(image) /*Text('\$$price')*/,
              ),
              title: Text(
                title,
                maxLines: 1,
              ),
              subtitle:
                  Text('Total: \$${(price * quantity).toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false)
                          .addOrRemoveQuantity(productId, false, quantity);
                    },
                    /*(quantity > 1)
                      ? () => {
                            Provider.of<Cart>(context, listen: false)
                                .addOrRemoveQuantity(productId, false)
                          }
                      : () => {
                            Provider.of<Cart>(context, listen: false)
                                .removeItem(productId)
                          },*/
                    icon: const Icon(Icons.remove, color: Colors.black),
                  ),
                  Text('$quantity x'),
                  IconButton(
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false)
                          .addOrRemoveQuantity(productId, true, quantity);
                    },
                    icon: const Icon(Icons.add, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
