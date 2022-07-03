import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:you_tube/model.dart';

//import 'package:youtube/VideoPlayer.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;
  /*Future<List<channelModel>> ReadJsonData() async {
    //read json file
    final String jsondata =
        await rootBundle.rootBundle.loadString('assets/dataset.json');
    //decode json data as list
    final list = await json.decode(jsondata) as List<dynamic>;

    //map json and initialize using DataModel
    return list.map((e) => channelModel.fromJson(e)).toList();
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/dataset.json'),
            builder: (context, snapshot) {
              // Decode the JSON
              var items = json.decode(snapshot.data.toString());

              /* return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 32, bottom: 32, left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => Welcome()));
                                },
                                child: Text(
                                  newData[index]['title'],
                                  //'Note Title',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                              Text(
                                newData[index]['text'],
                                //'Note Text',
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                          //SizedBox(width: 20),
                          Container(
                            height: 50,
                            width: 50,
                            child: Image.asset(newData[index]['img']),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: newData == null ? 0 : newData.length,
              );
            },*/

              /* future: ReadJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<channelModel>;*/
              return ListView.builder(
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          AspectRatio(
                            child: Image(
                              image: NetworkImage(items[index]['coverPicture']),
                              // centerSlice: Rect.largest,

                              fit: BoxFit.cover,
                            ),
                            aspectRatio: 16 / 9,
                          ),
                          ListTile(
                            leading: // CircleAvatar(
                                //backgroundImage:
                                //   NetworkImage(items[index]['coverPicture']),
                                //),
                                Text(
                              items[index]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text("Views :" +
                                items[index]['id'].toString() +
                                "          Date uploaded " +
                                items[index]['id'].toString() +
                                "/02/2022"),
                            //subtitle: Text(items[index]['id'],
                            //" . "
                            //items[index]['/id/03/2002'],
                            // style: TextStyle(
                            //   color: Colors.grey,
                            //)),
                            trailing: Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                    );
                  });
            })); //else {
    //return Center(
    // child: CircularProgressIndicator(),
    //);
  }
}
