class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? githubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.githubLink,
  });
}

List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/prayertimesapp.jpg',
    title: 'Prayer times app',
    subtitle:
        'This is a prayer times application for muslims to know prayer times day by day.',
    githubLink: 'https://github.com/NadaMakkawy/prayer_times_api_test.git',
  ),
  ProjectUtils(
    image: 'assets/projects/notesapp.jpg',
    title: 'One-line notes App',
    subtitle: 'This is a notes application for writing everyday notes.',
    githubLink: 'https://github.com/NadaMakkawy/onelinenotesapp.git',
  ),
  ProjectUtils(
    image: 'assets/projects/notesapp2.jpg',
    title: 'Starry Notes app',
    subtitle:
        'This is a notes application where you can store and star your notes',
    githubLink: 'https://github.com/NadaMakkawy/starrynotesapp.git',
  ),
];
