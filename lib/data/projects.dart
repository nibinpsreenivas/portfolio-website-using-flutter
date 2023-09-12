class Project {
  final String? name;
  final String? description;
  final String? image;
  final String? url;
  final List<String>? skills;

  Project({this.name, this.description, this.image, this.url, this.skills});
}

// ignore: non_constant_identifier_names
List<Project> PROJECTS = [
  Project(
    name: 'CEC Connect',
    description:
        'Developed a centralized platform for teachers and student.skill based student searching, profile viewing,staff directory chatbot and SGPA calculation.',
    image: 'images/projects/cec.png',
    url: 'https://github.com/nibinpsreenivas/CEC-CONNECT',
    skills: [
      'Dart',
      'Java',
      'Firebase',
      'Firestore',
      'Flutter',
      'Github',
      'Git',
      'Dialogflow',
    ],
  ),
  Project(
    name: 'TODO App',
    description:
        'It is a simple todo app.It allow user to add new list,mark complete the list and delete the list.',
    image: 'images/projects/todo.png',
    url: 'https://github.com/nibinpsreenivas/TODO-App',
    skills: [
      'Dart',
      'Flutter',
      'Git',
    ],
  ),
  Project(
    name: 'BMI CALCULATOR',
    description: 'It is used to calculate BMI CALCULATOR',
    image: 'images/projects/bmi.png',
    url: 'https://github.com/nibinpsreenivas/BMI-Calculator-using-Flutter',
    skills: [
      'Dart',
      'Flutter',
      'Git',
    ],
  ),
  Project(
    name: 'FIND YOUR TRAIN App',
    description: 'FIND YOUR TRAIN is a fully functional tarin app.',
    image: 'images/projects/train.png',
    url: 'https://github.com/nibinpsreenivas/Find-Your-Train',
    skills: [
      'Dart',
      'Flutter',
      'Git',
      'Restapi',
    ],
  ),
  Project(
    name: 'SGPA Calculator App',
    description:
        'It can be used to calculator sgpa.It take course name,grade and credit as input and display the sgpa as output.',
    image: 'images/projects/sgpa.png',
    url: 'https://github.com/nibinpsreenivas/SGPA-CALUCLATOR',
    skills: [
      'Dart',
      'Flutter',
      'Git',
    ],
  ),
  Project(
    name: 'CHAT BOT',
    description: 'A chat bot made using dialogflow.',
    image: 'images/projects/chat.png',
    url: 'https://github.com/nibinpsreenivas/chat_bot',
    skills: [
      'Dart',
      'Flutter',
      'Git',
    ],
  ),
];
