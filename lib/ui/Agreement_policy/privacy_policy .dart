
import 'package:flutter/material.dart';


class privacy_policy extends StatelessWidget {
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
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Privacy policy",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text('''This acceptable use policy "("Policy") sets forth the general guidelines and acceptable and prohibited uses of the "CovidOps" mobile application ("Mobile Application" or "Service") and any of its related products and services (collectively, "Services"). This Policy is a legally binding agreement between you ("User", "you" or "your") and this Mobile Application developer ("Operator", "we", "us" or "our").By accessing and using the Mobile Application and Services, you acknowledge that you have read, understood, and agree to be bound by the terms of this Agreement. If you are entering into this Agreement on behalf of a business or other legal entity, you represent that you have the authority to bind such entity to this Agreement, in which case the terms "User", "you" or "your" shall refer to such entity. If you do not have such authority, or if you do not agree with the terms of this Agreement, you must not accept this Agreement and may not access and use the Mobile Application and Services. You acknowledge that this Agreement is a contract between you and the Operator, even though it is electronic and is not physically signed by you, and it governs your use of the Mobile Application and Services.''',
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Automatic collection of information",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Our top priority is customer data security and, as such, we exercise the no logs policy. We may process only minimal user data, only as much as it is absolutely necessary to maintain the Mobile Application and Services. Information collected automatically is used only to identify potential cases of abuse and establish statistical information regarding the usage of the Mobile Application and Services. This statistical information is not otherwise aggregated in such a way that would identify any particular user of the system.",
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Collection of personal information",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text('''You can access and use the Mobile Application and Services without telling us who you are or revealing any information by which someone could identify you as a specific, identifiable individual. If, however, you wish to use some of the features in the Mobile Application, you may be asked to provide certain Personal Information (for example, your name and e-mail address). We receive and store any information you knowingly provide to us when you create an account, publish content, or fill any online forms in the Mobile Application. When required, this information may include the following:''',
                    maxLines: 20,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(

                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(18.0),
                  child: Text('''  1.   Personal details such as name, country of residence, etc.
  2.  Contact information such as email address, address, etc.
  3.  Account details such as user name, unique user ID, password, etc.
  4.  Geolocation data such as latitude and longitude
  5.  Certain features on the mobile device such as contacts, calendar, gallery, etc.
  6.  Any other materials you willingly submit to us such as articles, images, feedback, etc''',
                    maxLines: 20,
                    textAlign:TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text('''Some of the information we collect is directly from you via the Mobile Application and Services. However, we may also collect Personal Information about you from other sources such as public databases and our joint marketing partners. You can choose not to provide us with your Personal Information, but then you may not be able to take advantage of some of the features in the Mobile Application. Users who are uncertain about what information is mandatory are welcome to contact us.''',
                    maxLines: 20,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Use and processing of collected information",
                      style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),
                      textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("In order to make the Mobile Application and Services available to you, or to meet a legal obligation, we may need to collect and use certain Personal Information. If you do not provide the information that we request, we may not be able to provide you with the requested products or services. Any of the information we collect from you may be used for the following purposes:",
                    maxLines: 20,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(

                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(18.0),
                  child: Text('''  1.  Send administrative information.
  2.  Respond to inquiries and offer support.
  3.  Request user feedback.
  4.  Improve user experience
  5.  Enforce terms and conditions and policies
  6.  Protect from abuse and malicious users
  7.  Respond to legal requests and prevent harm
  8. Run and operate the Mobile Application and Services''',
                    maxLines: 20,
                    textAlign:TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text('''Processing your Personal Information depends on how you interact with the Mobile Application and Services, where you are located in the world and if one of the following applies: (i) you have given your consent for one or more specific purposes; this, however, does not apply, whenever the processing of Personal Information is subject to California Consumer Privacy Act or European data protection law; (ii) provision of information is necessary for the performance of an agreement with you and/or for any pre-contractual obligations thereof; (iii) processing is necessary for compliance with a legal obligation to which you are subject; (iv) processing is related to a task that is carried out in the public interest or in the exercise of official authority vested in us; (v) processing is necessary for the purposes of the legitimate interests pursued by us or by a third party.Note that under some legislations we may be allowed to process information until you object to such processing (by opting out), without having to rely on consent or any other of the following legal bases below. In any case, we will be happy to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Information is a statutory or contractual requirement, or a requirement necessary to enter into a contract.''',
                    maxLines: 20,
                    textAlign:TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Managing information",style:
                  TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),
                      textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("You are able to delete certain Personal Information we have about you. The Personal Information you can delete may change as the Mobile Application and Services change. When you delete Personal Information, however, we may maintain a copy of the unrevised Personal Information in our records for the duration necessary to comply with our obligations to our affiliates and partners, and for the purposes described below. If you would like to delete your Personal Information or permanently delete your account, you can do so on the settings page of your account in the Mobile Application.",
                    maxLines: 20,
                    textAlign:TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Disclosure of information",style:
                  TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),
                      textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Depending on the requested Services or as necessary to complete any transaction or provide any service you have requested, we may share your information with your consent with our trusted third parties that work with us, any other affiliates and subsidiaries we rely upon to assist in the operation of the Mobile Application and Services available to you. We do not share Personal Information with unaffiliated third parties. These service providers are not authorized to use or disclose your information except as necessary to perform services on our behalf or comply with legal requirements. We may share your Personal Information for these purposes only with third parties whose privacy policies are consistent with ours or who agree to abide by our policies with respect to Personal Information. These third parties are given Personal Information they need only in order to perform their designated functions, and we do not authorize them to use or disclose Personal Information for their own marketing or other purposes.",
                    maxLines: 20,
                    textAlign:TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Retention of information",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("We will retain and use your Personal Information for the period necessary to comply with our legal obligations, resolve disputes, and enforce our agreements unless a longer retention period is required or permitted by law. We may use any aggregated data derived from or incorporating your Personal Information after you update or delete it, but not in a manner that would identify you personally. Once the retention period expires, Personal Information shall be deleted. Therefore, the right to access, the right to erasure, the right to rectification and the right to data portability cannot be enforced after the expiration of the retention period.",
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("The rights of users",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text(''' You may exercise certain rights regarding your information processed by us. In particular, you have the right to do the following: (i) you have the right to withdraw consent where you have previously given your consent to the processing of your information; (ii) you have the right to object to the processing of your information if the processing is carried out on a legal basis other than consent; (iii) you have the right to learn if information is being processed by us, obtain disclosure regarding certain aspects of the processing and obtain a copy of the information undergoing processing; (iv) you have the right to verify the accuracy of your information and ask for it to be updated or corrected; (v) you have the right, under certain circumstances, to restrict the processing of your information, in which case, we will not process your information for any purpose other than storing it; (vi) you have the right, under certain circumstances, to obtain the erasure of your Personal Information from us; (vii) you have the right to receive your information in a structured, commonly used and machine readable format and, if technically feasible, to have it transmitted to another controller without any hindrance. This provision is applicable provided that your information is processed by automated means and that the processing is based on your consent, on a contract which you are part of or on pre-contractual obligations thereof.''',
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("The right to object to processing",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text('''Where Personal Information is processed for the public interest, in the exercise of an official authority vested in us or for the purposes of the legitimate interests pursued by us, you may object to such processing by providing a ground related to your particular situation to justify the objection.''',
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Data protection rights under GDPR",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("If you are a resident of the European Economic Area (EEA), you have certain data protection rights and the Operator aims to take reasonable steps to allow you to correct, amend, delete, or limit the use of your Personal Information. If you wish to be informed what Personal Information we hold about you and if you want it to be removed from our systems, please contact us. In certain circumstances, you have the following data protection rights:",
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),

                // Extra
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("You have the right to complain to a Data Protection Authority about our collection and use of your Personal Information. For more information, please contact your local data protection authority in the European Economic Area (EEA).",
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),





                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("California privacy rights",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text('''In addition to the rights as explained in this Policy, California residents who provide Personal Information (as defined in the statute) to obtain products or services for personal, family, or household use are entitled to request and obtain from us, once a calendar year, information about the Personal Information we shared, if any, with other businesses for marketing uses. If applicable, this information would include the categories of Personal Information and the names and addresses of those businesses with which we shared such personal information for the immediately prior calendar year (e.g., requests made in the current year will receive information about the prior year). To obtain this information please contact us''',
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text('''You acknowledge that you have read this Policy and agree to all its terms and conditions. By accessing and using the Mobile Application and Services you agree to be bound by this Policy. If you do not agree to abide by the terms of this Policy, you are not authorized to access or use the Mobile Application and Services. This acceptable use policy was created with the acceptable use policy generator.''',
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("How to exercise these rights",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Any requests to exercise your rights can be directed to the Operator through the contact details provided in this document. Please note that we may ask you to verify your identity before responding to such requests. Your request must provide sufficient information that allows us to verify that you are the person you are claiming to be or that you are the authorized representative of such person. You must include sufficient details to allow us to properly understand the request and respond to it. We cannot respond to your request or provide you with Personal Information unless we first verify your identity or authority to make such a request and confirm that the Personal Information relates to you.",
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Privacy of children",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text('''We do not knowingly collect any Personal Information from children under the age of 18. If you are under the age of 18, please do not submit any Personal Information through the Mobile Application and Services. We encourage parents and legal guardians to monitor their children's Internet usage and to help enforce this Policy by instructing their children never to provide Personal Information through the Mobile Application and Services without their permission. If you have reason to believe that a child under the age of 18 has provided Personal Information to us through the Mobile Application and Services, please contact us. You must also be at least 16 years of age to consent to the processing of your Personal Information in your country (in some countries we may allow your parent or guardian to do so on your behalf).''',
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Links to other resources",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text('''The Mobile Application and Services contain links to other resources that are not owned or controlled by us.Please be aware that we are not responsible for the privacy practices of such other resources or third parties. We encourage you to be aware when you leave the Mobile Application and Services and to read the privacy statements of each and every resource that may collect Personal Information.''',
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Information security",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("We secure information you provide on computer servers in a controlled, secure environment, protected from unauthorized access, use, or disclosure. We maintain reasonable administrative, technical, and physical safeguards in an effort to protect against unauthorized access, use, modification, and disclosure of Personal Information in its control and custody. However, no data transmission over the Internet or wireless network can be guaranteed. Therefore, while we strive to protect your Personal Information, you acknowledge that (i) there are security and privacy limitations of the Internet which are beyond our control; (ii) the security, integrity, and privacy of any and all information and data exchanged between you and the Mobile Application and Services cannot be guaranteed; and (iii) any such information and data may be viewed or tampered with in transit by a third party, despite best efforts.",
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Data breach",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("In the event we become aware that the security of the Mobile Application and Services has been compromised or users Personal Information has been disclosed to unrelated third parties as a result of external activity, including, but not limited to, security attacks or fraud, we reserve the right to take reasonably appropriate measures, including, but not limited to, investigation and reporting, as well as notification to and cooperation with law enforcement authorities. In the event of a data breach, we will make reasonable efforts to notify affected individuals if we believe that there is a reasonable risk of harm to the user as a result of the breach or if notice is otherwise required by law. When we do, we will post a notice in the Mobile Application",
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Changes and amendments",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text('''We reserve the right to modify this Policy or its terms relating to the Mobile Application and Services from time to time in our discretion and will notify you of any material changes to the way in which we treat Personal Information. When we do, we will revise the updated date at the bottom of this page. We may also provide notice to you in other ways in our discretion, such as through contact information you have provided. Any updated version of this Policy will be effective immediately upon the posting of the revised Policy unless otherwise specified. Your continued use of the Mobile Application and Services after the effective date of the revised Policy (or such other act specified at that time) will constitute your consent to those changes. However, we will not, without your consent, use your Personal Information in a manner materially different than what was stated at the time your Personal Information was collected.''',
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Acceptance of this policy",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("You acknowledge that you have read this Policy and agree to all its terms and conditions. By accessing and using the Mobile Application and Services you agree to be bound by this Policy. If you do not agree to abide by the terms of this Policy, you are not authorized to access or use the Mobile Application and Services. This privacy policy was created with the privacy policy generator",
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text("Contacting us",style: TextStyle(color:Colors.black,fontSize:34,fontWeight:FontWeight.bold),textAlign:TextAlign.left),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.all(12.0),
                  child: Text('''If you would like to contact us to understand more about this Policy or wish to contact us concerning any matter relating to individual rights and your Personal Information, you may send an email to aman.19je0108@mech.iitism.ac.in. This document was last updated on May 5, 2021 CovidOps''',
                    maxLines: 20,
                    textAlign: TextAlign.left,
                    style: TextStyle(color:Colors.black,fontSize:26),),
                ),




                Container(
                  alignment: Alignment.center,
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

