import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("リスト"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: const TextField(
                  decoration: InputDecoration(hintText: "Input"),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 30,
                itemBuilder: (context, index) => ListTile(
                  title: Text("item ${index + 1}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        cacheExtent: 0,
        primary: true,
        children: const [
          MyBox(color: Colors.red),
          MyBox(color: Colors.blue),
          MyBox(color: Colors.greenAccent),
          MyBox(color: Colors.yellow),
          MyBox(color: Colors.indigo),
        ],
      ),
    );
  }
}

class MyBox extends StatelessWidget {
  final Color color;

  const MyBox({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("MyBox: ${color.toString()}. Built!");
    return Container(height: 600, color: color);
  }
}

/*
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyBox(color: Colors.red),
            MyBox(color: Colors.blue),
            MyBox(color: Colors.greenAccent),
            MyBox(color: Colors.yellow),
            MyBox(color: Colors.indigo),
          ],
        ),
      ),
    );
  }
}

class MyBox extends StatelessWidget {
  final Color color;
  const MyBox({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("MyBox: ${color.toString()}. Built!");
    return Container(height: 600, color: color);
  }
}
*/

/// RepaintBoundary very good example
/*import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

void main() {
  debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Tutorial',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey _paintKey = GlobalKey();
  Offset _offset = Offset.zero;

  Widget _buildBackground() {
    return RepaintBoundary(
      child: CustomPaint(
        painter: MyExpensiveBackground(MediaQuery.of(context).size),
        isComplex: true,
        willChange: false,
      ),
    );
  }

  Widget _buildCursor() {
    return Listener(
      onPointerDown: _updateOffset,
      onPointerMove: _updateOffset,
      child: CustomPaint(
        key: _paintKey,
        painter: MyPointer(_offset),
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tutorial'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _buildBackground(),
          _buildCursor(),
        ],
      ),
    );
  }

  _updateOffset(PointerEvent event) {
    RenderBox? referenceBox = _paintKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = referenceBox.globalToLocal(event.position);
    setState(() {
      _offset = offset;
    });
  }
}

class MyExpensiveBackground extends CustomPainter {

  static const List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.orange,
  ];

  final Size _size;

  MyExpensiveBackground(this._size);

  @override
  void paint(Canvas canvas, Size size) {
    debugPrint('Running extensive painting');
    final Random rand = Random(12345);

    for (int i = 0; i < 10000; i++) {
      canvas.drawOval(
          Rect.fromCenter(
            center: Offset(
              rand.nextDouble() * _size.width - 100,
              rand.nextDouble() * _size.height,
            ),
            width: rand.nextDouble() * rand.nextInt(150) + 200,
            height: rand.nextDouble() * rand.nextInt(150) + 200,
          ),
          Paint()
            ..color = colors[rand.nextInt(colors.length)].withOpacity(0.3)
      );
    }
  }

  @override
  bool shouldRepaint(MyExpensiveBackground other) => false;
}

class MyPointer extends CustomPainter {

  final Offset _offset;

  MyPointer(this._offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      _offset,
      10.0,
      Paint()..color = Colors.black,
    );
  }

  @override
  bool shouldRepaint(MyPointer oldDelegate) => oldDelegate._offset != _offset;
}*/

/// second example
/*import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


void main() {
  debugPaintLayerBordersEnabled = true;
  debugRepaintRainbowEnabled = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Tutorial',
      home: RepaintBoundaryExample(),
    );
  }
}

class RepaintBoundaryExample extends StatefulWidget {
  const RepaintBoundaryExample({super.key});


  @override
  State createState() => _RepaintBoundaryExampleState();
}

class _RepaintBoundaryExampleState extends State<RepaintBoundaryExample> {

  double _size = 50;

  Widget _buildListView() {
    return Expanded(
      child: ListView.builder(
        addRepaintBoundaries: true,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 50,
              color: Colors.teal,
              child: const Center(
                child: Text('Flutter'),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimationBox() {
    return Container(
      color: Colors.pink,
      width: 200,
      height: 200,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 5),
            width: _size,
            height: _size,
            color: Colors.teal,
          ),
          OutlinedButton(
            child: const Text('Animate box'),
            onPressed: () {
              setState(() {
                _size = _size == 50 ? 150 : 50;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Tutorial'),
      ),
      body: Column(
        children: [
          _buildAnimationBox(),
          _buildListView(),
        ],
      ),
    );
  }
}*/

/*/// keepAlive Example
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: controller,
            tabs: const <Widget>[
              Tab(text: "1"),
              Tab(text: "2"),
              Tab(text: "3"),
              Tab(text: "4"),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: const <Widget>[
            SubPage(),
            SubPage(),
            SubPage(),
            SubPage(),
          ],
        ),
      ),
    );
  }
}

class SubPage extends StatefulWidget {
  const SubPage({super.key});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const ListViewWidget();
  }

  @override
  bool get wantKeepAlive => true;
}

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: 50,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return ListTile(
      title: Text(index.toString()),
    );
  }
}*/

/// Without keepAlive
/*
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: controller,
            tabs: const <Widget>[
              Tab(text: "1"),
              Tab(text: "2"),
              Tab(text: "3"),
              Tab(text: "4"),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: const <Widget>[
            SubPage(),
            SubPage(),
            SubPage(),
            SubPage(),
          ],
        ),
      ),
    );
  }
}

class SubPage extends StatefulWidget {
  const SubPage({super.key});

  @override
  State<SubPage> createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  @override
  Widget build(BuildContext context) {
    return const ListViewWidget();
  }
}

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: 50,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return ListTile(
      title: Text(index.toString()),
    );
  }
}
*/

/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView inside SingleChildScrollView'),
        ),
        body: SingleChildScrollView(  // <==== 주인공. Column 하나를 child로 가짐
          child: Column(  // 물론 Row도 가능
            children: [
              Container(
                height: 150,
                color: Colors.red,
                child: const Center(
                  child: Text("Some Widgets"),
                ),
              ),
              ListView.builder(  // <=== 성능을 생각한다면 ListView.builder 로 사용
                shrinkWrap: true, // <==== limit height. 리스트뷰 크기 고정
                primary: true, // <====  disable scrolling. 리스트뷰 내부는 스크롤 안할거임
                itemCount: 10,
                itemBuilder: (context, index) => ListTile(
                  title: Text("Item ${index + 1}"),
                ),
              ),
              Container(
                height: 150,
                color: Colors.green,
                child: const Center(
                  child: Text("Some Widgets"),
                ),
              ),
              Container(
                height: 150,
                color: Colors.blue,
                child: const Center(
                  child: Text("Some Widgets"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

/*
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: false,
      ),
      body: ListView(
        cacheExtent: 0,
        primary: false,
        children: const [
          MyBox(color: Colors.red),
          MyBox(color: Colors.blue),
          MyBox(color: Colors.greenAccent),
          MyBox(color: Colors.yellow),
          MyBox(color: Colors.indigo),
        ],
      ),
    );
  }
}

class MyBox extends StatelessWidget {
  final Color color;
  const MyBox({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("MyBox: ${color.toString()}. Built!");
    return Container(height: 600, color: color);
  }
}

*/

/*
import 'dart:math';

import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final random = Random();
    final items = List<int>.generate(
      10,
          (int index) => index,
      growable: true,
    );

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: StatefulBuilder(
        builder: (context, setState) {
          return Scaffold(
            body: Center(
              child: ListWidget(items: items),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                final nextItem = items.length;
                final nextIndex = random.nextInt(nextItem + 1);
                print('nextIndex=$nextIndex, nextItem=$nextItem');
                setState(() {
                  items.insert(nextIndex, nextItem);
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({Key? key, required this.items}) : super(key: key);

  final List<int> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = items[index];
        return ItemWidget(key: ValueKey(item), item: item);
      },
      itemCount: items.length,
      findChildIndexCallback: (Key key) {
        final valueKey = key as ValueKey;
        final index = items.indexWhere((item) => item == valueKey.value);
        if (index == -1) return null;
        return index;
      },
    );
  }
}

class ItemWidget extends StatefulWidget {
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  final int item;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget>
    with AutomaticKeepAliveClientMixin {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListTile(
      selected: selected,
      title: Text('Index-${widget.item}'),
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
*/
