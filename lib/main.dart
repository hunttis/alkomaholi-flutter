import 'package:intl/intl.dart';
import 'package:alkomaholi/alko_api/alko_api.dart';
import 'package:alkomaholi/alko_api/alko_response.dart';
import 'package:flutter/material.dart';

void main() => runApp(AlkomaholiApp());

class AlkomaholiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alkomaholi',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: SearchPage(title: 'Alkomaholi'),
    );
  }
}

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final AlkoApi _alko = AlkoApi();

  Future<List<Product>> _products;

  void _search(String searchTerm) {
    setState(() {
      _products = _alko.getProducts(searchTerm);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchBar(search: _search),
        ),
        body: FutureBuilder<List<Product>>(
            future: _products ?? Future.value([]),
            initialData: [],
            builder: (context, snapshot) {
              return ProductList(products: snapshot.data);
            }));
  }
}

class SearchBar extends StatefulWidget {
  final Function(String) search;

  const SearchBar({Key key, @required this.search}) : super(key: key);

  @override
  SearchBarState createState() {
    return SearchBarState();
  }
}

class SearchBarState extends State<SearchBar> {
  var searchTerm = '';

  void setSearchTerm(String term) {
    setState(() => searchTerm = term);
  }

  void search() {
    if (searchTerm.length > 2) {
      widget.search(searchTerm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(onChanged: setSearchTerm, onEditingComplete: search);
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(product.nimi,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                ProductInfo(product: product)
              ],
            ),
          ));
        },
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  String fixedCurrency(String string) {
    final formatter =
        NumberFormat.currency(locale: 'fi_FI', decimalDigits: 2, symbol: '€');
    return formatter.format(double.parse(string));
  }

  String fixedCurrencyPerLiter(String string) {
    final formatter =
        NumberFormat.currency(locale: 'fi_FI', decimalDigits: 2, symbol: '€/l');
    return formatter.format(double.parse(string));
  }

  String bottleSizeNumber(String string) {
    final formatter = NumberFormat.decimalPattern('fi_FI');
    final parsedDouble =
        double.parse(string.split(' ')[0].replaceFirst(',', '.'));
    return '${formatter.format(parsedDouble)} l  ';
  }

  String alcoholPctNumber(String string) {
    final formatter = NumberFormat('#.00', 'fi_FI');
    final parsedDouble = double.parse(string);
    return '${formatter.format(parsedDouble)} %';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProductInfoRow(
                name: 'Pullokoko',
                value: product.pullokoko,
                valueToText: bottleSizeNumber,
              ),
              ProductInfoRow(
                name: 'Alkoholi-%',
                value: product.alkoholi,
                valueToText: alcoholPctNumber,
              ),
            ],
          ),
        ),
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProductInfoRow(
                value: product.hinta,
                name: 'Hinta',
                valueToText: fixedCurrency,
              ),
              ProductInfoRow(
                name: 'Litrahinta:',
                value: product.litrahinta,
                valueToText: fixedCurrencyPerLiter,
              )
            ],
          ),
        )
      ],
    );
  }
}

class ProductInfoRow extends StatelessWidget {
  final String name;
  final String value;
  final String Function(String) valueToText;

  const ProductInfoRow(
      {Key key,
      @required this.name,
      @required this.value,
      @required this.valueToText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return value == null
        ? Container()
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[Text('$name:'), Text(valueToText(value))],
          );
  }
}
