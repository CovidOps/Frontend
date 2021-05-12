import 'package:covigenix/helper.dart';
import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> with TickerProviderStateMixin{
  //late TabController _tabController;
  final List<Tab> _tabs = <Tab>[
    Tab(text: "Requests"),
    Tab(text: "Availability"),
  ];

  /*@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }*/

  void openAddCommunity(int index){
    Helper.goodToast("Trying to open ${index==0?"Requests":"Availability"}");
  }
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            tabs: _tabs,
          ),
          body: TabBarView(
            children: [
              Center(child: Text("Requests Tab"),),
              Center(child: Text("Availability Tab"),),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () => openAddCommunity(DefaultTabController.of(context)!.index)),
        )
    );
  }
}
