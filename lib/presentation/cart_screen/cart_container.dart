part of '../cart_screen.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({
    Key? key,
    required this.items,
    this.onAddButtonPressed,
    this.onRemoveButtonPressed,
  }) : super(key: key);

  final List<Item> items;
  final void Function()? onAddButtonPressed;
  final void Function()? onRemoveButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ...items
              .map((item) => _ItemTile(
                    item,
                    onAddButtonPressed,
                    onRemoveButtonPressed,
                  ))
              .toList(),
        ],
      ),
    );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile(
    this.item,
    this.onAddButtonPressed,
    this.onRemoveButtonPressed, {
    Key? key,
  }) : super(key: key);

  final Item item;
  final void Function()? onAddButtonPressed;
  final void Function()? onRemoveButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 20),
            Text(
              item.name,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.close, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'images/${item.image}',
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Offstage(
                  offstage: item.description == null,
                  child: Text(
                    item.description ?? '',
                    style: TextStyle(
                      color: Color.fromRGBO(125, 125, 125, 1),
                    ),
                  ),
                ),
                Text('${item.price.formatToString()}${Label.won.displayName}'),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _CounterButton(onAddButtonPressed, onRemoveButtonPressed),
            SizedBox(width: 20)
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class _CounterButton extends StatelessWidget {
  const _CounterButton(
    this.onAddButtonPressed,
    this.onRemoveButtonPressed, {
    Key? key,
  }) : super(key: key);

  final void Function()? onAddButtonPressed;
  final void Function()? onRemoveButtonPressed;

  @override
  Widget build(BuildContext context) {
    final int count = Counter.of(context).count;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            disabledColor: Colors.grey,
            onPressed: onAddButtonPressed,
          ),
          Text(count.toString()),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: onAddButtonPressed,
          ),
        ],
      ),
    );
  }
}
