import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About App')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            const Text(
              'अनुवादक:',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Card(
              child: Image.asset("assets/guru.jpg", fit: BoxFit.cover),
              elevation: 5.0,
            ),
            const Text(
              'अभिषेक जोशी',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blue),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                "'दिव्याेपदेश श्री५ वडामहाराजाधिराज पृथ्वीनारायण शाहकाे अनुभव र उपदेशकाे संग्रह हाे।\n\n''पृथ्वीनारायण शाहले मृत्युशैय्यामा छँदा बाेलेका कुराहरुलाई शिवराम सिंह वस्न्यातका छाेरा काजी अभिमानसिंह वस्न्यातले संकलन गरेका थिए ।\n\n''अभिमान सिंह वस्न्यात पृथ्वीनारायण शाहका नेपाल एकीकरणका एक याेध्दा पनि हुन् ।\n\n''तिनै अभिमानसिंहका सन्तान वखतमानसिंहकाे घरमा याे दिव्याेपदेशकाे हस्तलिखित प्रति सुरक्षित छ। \n\n''याेगी नरहरिनाथले वखतमानसिंहकाे घरमा रहेकाे दिव्याेपदेशलाई सम्पादन गरि सार्वजनिक गर्नुभएको हाे ।\n\n''याेगी नरहरिनाथद्वारा सम्पादित तथा संकलित दिव्याेपदेशमा रहेका मुल नितिहरुमाथि अभिषेक जाेशीले व्याख्या गरेका छन् ।\n\nपुस्तक छपाउन सहयोग गर्न । सहयोग गर्न \n\n'",
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
