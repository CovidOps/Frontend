
import 'package:flutter/material.dart';


class acc_use_policy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyTextPage()
    );
  }
}
class MyTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text("CovidOps",style : TextStyle(fontSize:45.0)),

      ),
      body: SingleChildScrollView(
        child:Column(
          children:<Widget>[
            Container(

              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(12.0),
              child: Text("Acceptable Use Policy",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(12.0),
              child: Text('''This acceptable use policy "("Policy") sets forth the general guidelines and acceptable and prohibited uses of the "CovidOps" mobile application ("Mobile Application" or "Service") and any of its related products and services (collectively, "Services"). This Policy is a legally binding agreement between you ("User", "you" or "your") and this Mobile Application developer ("Operator", "we", "us" or "our").By accessing and using the Mobile Application and Services, you acknowledge that you have read, understood, and agree to be bound by the terms of this Agreement. If you are entering into this Agreement on behalf of a business or other legal entity, you represent that you have the authority to bind such entity to this Agreement, in which case the terms "User", "you" or "your" shall refer to such entity. If you do not have such authority, or if you do not agree with the terms of this Agreement, you must not accept this Agreement and may not access and use the Mobile Application and Services. You acknowledge that this Agreement is a contract between you and the Operator, even though it is electronic and is not physically signed by you, and it governs your use of the Mobile Application and Services.''',
                maxLines: 20,
                textAlign: TextAlign.left,
                style: TextStyle(color:Colors.black,fontSize:26),),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(12.0),

              child: Text("Prohibited activities and uses",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(18.0),
              child: Text(''' 1.   Distributing malware or other malicious code.
 2.  Disclosing sensitive personal information about others.
 3.  Collecting, or attempting to collect, personal information about third parties without their knowledge or consent. 
 4.  Distributing pornography or adult related content.
 4.  Promoting or facilitating prostitution or any escort services.
 5.  Hosting, distributing or linking to child pornography or content that is harmful to minors. 
 6.  Promoting or facilitating gambling, violence, terrorist activities or selling weapons or ammunition.
 7.  Engaging in the unlawful distribution of controlled substances, drug contraband or prescription medications. 
 8.  Managing payment aggregators or facilitators such as processing payments on behalf of other businesses or charities.
 9.  Facilitating pyramid schemes or other models intended to seek payments from public actors. 
10. Threatening harm to persons or property or otherwise harassing behavior.
11. Infringing the intellectual property or other proprietary rights of others.
12. Facilitating, aiding, or encouraging any of the above activities through the Mobile Application and Services.''',
                maxLines: 20,
                textAlign:TextAlign.left,
                style: TextStyle(color:Colors.black,fontSize:26),),
            ),


            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(12.0),
              child: Text('''You may not use the Mobile Application and Services to publish content or engage in activity that is illegal under applicable law, that is harmful to others, or that would subject us to liability, including, without limitation, in connection with any of the following, each of which is prohibited under this Policy:''',
                maxLines: 20,
                style: TextStyle(color:Colors.black,fontSize:26),),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(12.0),

              decoration: BoxDecoration(
                image:DecorationImage(
                  image:AssetImage("assets/images/logo.png"),

                ),
              ),
            ),



          ]
      ),


    )
    );
  }
}

