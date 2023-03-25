// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:pedrodap/Widget/Drawer.dart';
// import 'package:sizer/sizer.dart';

// class FitnessProgramme extends StatefulWidget {
//   const FitnessProgramme({super.key});

//   @override
//   State<FitnessProgramme> createState() => _FitnessProgrammeState();
// }

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// class _FitnessProgrammeState extends State<FitnessProgramme> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: drawer(),
//       key: _scaffoldKey,
//       backgroundColor: Colors.black,
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 4.w),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 3.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pop(context);
//                     },
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     'Fitness Programme',
//                     style: TextStyle(
//                       fontSize: 5.5.w,
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'Meta1',
//                       color: Color(0xffffffff),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       _scaffoldKey.currentState?.openDrawer();
//                     },
//                     icon: Icon(
//                       Icons.menu,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:pedrodap/Model/todo.dart';
import 'package:pedrodap/Widget/todo_items.dart';
import 'package:sizer/sizer.dart';
import '../../Widget/Drawer.dart';
import '../../Widget/color.dart';

class Home extends StatefulWidget {
  String? title;
  String? desc;
  String? tile;

  Home({Key? key, this.desc, this.title, this.tile}) : super(key: key);

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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.tile.toString(),
                            style: TextStyle(
                              fontSize: 5.5.w,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Meta1',
                              color: Color(0xffffffff),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     IconButton(
                      //       onPressed: () {
                      //         Navigator.of(context).pop(context);
                      //       },
                      //       icon: Icon(
                      //         Icons.arrow_back,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //     Text(
                      //       widget.tile.toString(),
                      //       style: TextStyle(
                      //         fontSize: 5.5.w,
                      //         fontWeight: FontWeight.w500,
                      //         fontFamily: 'Meta1',
                      //         color: Color(0xffffffff),
                      //       ),
                      //     ),
                      //     IconButton(
                      //       onPressed: () {
                      //         _scaffoldKey.currentState?.openDrawer();
                      //       },
                      //       icon: Icon(
                      //         Icons.menu,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 2.h),
                      Container(
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 89.w,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.title.toString(),
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Meta1',
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 89.w,
                              child: Text(
                                widget.desc.toString(),
                                maxLines: 7,
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Meta1',
                                    color: Colors.grey.shade500),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      searchBox(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 52.h,
                  child: ListView(
                    children: [
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
            child: Container(
              color: Colors.black,
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
                      color: Colors.grey.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: _todoController,
                      decoration: InputDecoration(
                          hintText: 'Add a new todo item',
                          hintStyle: TextStyle(color: Colors.white),
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
                        fontSize: 20.sp,
                      ),
                    ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.withOpacity(0.20),
                      minimumSize: Size(7.h, 13.w),
                      elevation: 10,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
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
        color: Colors.grey.withOpacity(0.20),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
