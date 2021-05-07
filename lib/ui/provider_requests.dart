import 'package:covigenix/ui/provider_individual.dart';
import 'package:flutter/material.dart';

class ProviderRequestsList extends StatefulWidget {
  @override
  _ProviderRequestsListState createState() => _ProviderRequestsListState();
}

class _ProviderRequestsListState extends State<ProviderRequestsList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Open route'),
        onPressed: () {
          // Navigate to second route when tapped.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProviderRequestsIndiv()),
          );
        },
      ),
    );
  }
}
