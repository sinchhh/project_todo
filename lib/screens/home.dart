import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      drawer: Drawer(
        child: Container(
          color: Color(0xFFcfb284).withOpacity(0.4),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              // const DrawerHeader(
              //   decoration: BoxDecoration(
              //     color: Colors.blue,
              //   ),
              //   child: Text('Drawer Header'),
              // ),
              UserAccountsDrawerHeader(
                accountName: Text('Kitty Katt', style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                accountEmail: Text('kittie_meow3@gmail.com', style: TextStyle(fontSize: 12,),),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      'https://img.freepik.com/free-vector/cute-cat-sitting-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-4148.jpg?w=740&t=st=1668821195~exp=1668821795~hmac=c9d84d3e1c29532c2499f3fff5d3e8cc80de116907342a207b85c68dfa53cf4c',
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      //image: Image('assets/images/avatar.jpeg'),
                      image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home, size: 30,
                ),
                iconColor: Color(0xFF223c3f),
                title: const Text('Home',
                style: TextStyle(fontSize: 20, color: Color(0xFF3c696e)),),
                onTap: () {
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.add_task_rounded, size: 30,
                ),
                iconColor: Color(0xFF223c3f),
                title: const Text('New Task',
                  style: TextStyle(fontSize: 20, color: Color(0xFF3c696e)),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.palette, size: 30,
                ),
                iconColor: Color(0xFF223c3f),
                title: const Text('Themes',
                  style: TextStyle(fontSize: 20, color: Color(0xFF3c696e)),),
                onTap: () {
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.add_alert_rounded, size: 30,
                ),
                iconColor: Color(0xFF223c3f),
                title: const Text('Reminders',
                  style: TextStyle(fontSize: 20, color: Color(0xFF3c696e)),),
                onTap: () {
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.help_sharp, size: 30,
                ),
                iconColor: Color(0xFF223c3f),
                title: const Text('Help',
                  style: TextStyle(fontSize: 20, color: Color(0xFF3c696e)),),
                onTap: () {
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle_sharp, size: 30,
                ),
                iconColor: Color(0xFF223c3f),
                title: const Text('About Us',
                  style: TextStyle(fontSize: 20, color: Color(0xFF3c696e)),),
                onTap: () {
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.headset_mic_rounded, size: 30,
                ),
                iconColor: Color(0xFF223c3f),
                title: const Text('Contact Us',
                  style: TextStyle(fontSize: 20, color: Color(0xFF3c696e)),),
                onTap: () {
                  //Navigator.pop(context);
                },
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.train,
              //   ),
              //   title: const Text('Page 2'),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
            ],
          ),
        ),

      ),
      appBar: _buildAppBar(),
      //appBar: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/black-wallpaper-aesthetic.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 50,
                            bottom: 20,

                          ),

                          child: Text(
                            'All ToDos',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,

                            ),
                          ),
                        ),
                        for (ToDo todoo in _foundToDo.reversed)
                          ToDoItem(

                            todo: todoo,
                            onToDoChanged: _handleToDoChange,
                            onDeleteItem: _deleteToDoItem,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.98),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                          hintText: 'Add a new todo item',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      primary: Color(0xFF45787e),
                      minimumSize: Size(60, 60),
                      elevation: 10,

                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFFF2E5D9),
      elevation: 0,
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   iconSize: 30,
      //   onPressed: (){
      //     return NavBar();
      //   },
        //{return NavBar()},
      title: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        // Icon(
        //   Icons.menu,
        //   color: tdBlack,
        //   size: 30,
        // ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/avatar.jpeg'),
          ),
        ),
      ]),
    );
  }
}