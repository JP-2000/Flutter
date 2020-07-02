class PostList {
  final List<Post> posts;

  PostList({this.posts});

  factory PostList.fromJson(List<dynamic> parsedJson) {     //List<Post> will also work
    List<Post> temp_posts;  //creating list of type post
    temp_posts = parsedJson.map((i) => Post.fromJson(i)).toList();  //.map() is a function for iteratig through list. i => contains post ie object  // we are just adding objects or a Post tothe list
    return new PostList(posts: temp_posts);
  }
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body}); // curly braces for named parameters

  factory Post.fromJson(Map<String, dynamic> json) {   // factory => for avoiding creating instances by constructors
    return Post(
      userId : json['userId'],
      id : json['id'],
      title: json['title'],
      body: json['body']
    );
  }
}