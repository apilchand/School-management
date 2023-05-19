import 'package:flutter/material.dart';
import 'package:pathsala/screens/Welcome.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
     
      body: 
      
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: 
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                );
                      },
                      child: const Icon(
                        Icons.people
                      ),
                    ),
                    const Text("SignIn")
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'images/logo.png',
                width: 300,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to ABC School',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Empowering Education',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              
              
            
              const Text(
                'About ABC School',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "ABC Secondary School, located in Mahendranagar, Kanchanpur, Farwestern Province, Nepal, is a leading educational institution renowned for its academic excellence and holistic development. With a dedicated faculty and a comprehensive curriculum, the school prepares students for success in various fields. It emphasizes co-curricular activities and fosters a spirit of innovation to shape future leaders.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "At ABC Secondary School, students benefit from a supportive learning environment and state-of-the-art facilities. The school's infrastructure includes well-equipped classrooms, laboratories, a library, and modern sports facilities. Through a combination of quality education, character building, and community engagement, the school nurtures well-rounded individuals.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              const Text(
                "ABC Secondary School takes pride in its accomplished alumni network, who have excelled in academia, entrepreneurship, and public service. The institution's commitment to academic excellence, holistic development, and innovative teaching methods make it a premier choice for education in the region.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FeatureItem(
                    icon: Icons.calendar_today,
                    title: 'Academic Calendar',
                    onTap: () {
                      // Add your navigation logic here
                    },
                  ),
                  FeatureItem(
                    icon: Icons.people,
                    title: 'Faculty Members',
                    onTap: () {
                      // Add your navigation logic here
                    },
                  ),
                  FeatureItem(
                    icon: Icons.local_library,
                    title: 'Courses Offered',
                    onTap: () {
                      // Add your navigation logic here
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30,),
               const ContactSection(),
            ],
            
          ),
        ),
      ),
    //  bottomNavigationBar: const ContactSection(),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const FeatureItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: const Color.fromARGB(255, 118, 34, 6),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Mahendranagar, Kanchanpur',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'info@abcschool.com',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        '099-520264',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (screenWidth >= 600) ...[
                Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // Add your download logic here
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.download,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Download our mobile app',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        // Add your gallery link logic here
                      },
                      child: const Text(
                        'Gallery',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        // Add your academic link logic here
                      },
                      child: const Text(
                        'Academic',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        // Add your publication link logic here
                      },
                      child: const Text(
                        'Publication',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        // Add your report link logic here
                      },
                      child: const Text(
                        'Report',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
          if (screenWidth < 600) ...[
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                // Add your download logic here
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Download our mobile app',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                // Add your gallery link logic here
              },
              child: const Text(
                'Gallery',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                // Add your academic link logic here
              },
              child: const Text(
                'Academic',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                // Add your publication link logic here
              },
              child: const Text(
                'Publication',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                // Add your report link logic here
              },
              child: const Text(
                'Report',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ],
      )
    );
  }
}
