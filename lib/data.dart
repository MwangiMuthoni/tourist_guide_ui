class Article {
  final String title;
  final String image;
  final String location;
  final String author;
  final int likes;
  final int comments;
  final int shares;
  bool isLiked = false;

  Article(this.title, this.image, this.comments, this.likes, this.isLiked,
      this.location, this.shares, this.author);
}

List<Article> articles = [
  Article(
      'Japan\'s second largest metropolitan area',
      'https://media.istockphoto.com/id/625660018/photo/mt-fuji-and-lake-kawaguchiko-at-dawn.jpg?s=1024x1024&w=is&k=20&c=l_eFouAYXNwcRV1iuvbji6Ms20XjwRMBdF8lI4z_J6Q=',
      100,
      32000,
      true,
      'Osaka Japan',
      50,
      'Hussain Mustafa'),
  Article(
      'Known as the sleepless town for obvious reasons',
      'https://media.istockphoto.com/id/688114088/photo/mountain-fuji-and-milkyway-at-lake-motosu.jpg?s=1024x1024&w=is&k=20&c=SOwgc0chnwVNUufWiPO0lfpukNVYpI4e4yoFICol_sg=',
      300,
      50000,
      true,
      'Kabuikicho Japan',
      1250,
      'Tim Salvatore'),
  Article(
      'Japan\'s second largest metropolitan area',
      'https://media.istockphoto.com/id/1771970810/photo/lake-motosu-and-mt-fuji-sunrise-glow.jpg?s=1024x1024&w=is&k=20&c=CgzrWyIMWZMNurje16YIg-0ZnozhNc9dQwQ_FRhC8M4=',
      200,
      10000,
      true,
      'Tokyo Japan',
      1000,
      'Ely Marya'),
];
