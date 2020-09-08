
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfile/model.dart';
import 'package:syncfile/repo.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<RepoData>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    List<Citybeans> data = Provider.of<RepoData>(context).citybeans;
    return Scaffold(
        body: data.length > 0
            ? ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.amber,
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 10,)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('breweryType ${data[index].breweryType}'),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('id ${data[index].id}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('street ${data[index].street}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('name ${data[index].name}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('city ${data[index].city}'),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('state ${data[index].state}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('postalCode ${data[index].postalCode}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('country ${data[index].country}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('longitude ${data[index].longitude}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('latitude ${data[index].latitude}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('phone ${data[index].phone}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('websiteUrl ${data[index].websiteUrl}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('updatedAt ${data[index].updatedAt}'),
                      ),
                    ],
                  ));
                },
              )
            : Center(
                child: Container(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              )));
  }
}
