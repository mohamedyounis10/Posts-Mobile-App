import 'package:flutter/material.dart';
import 'package:postsapp/screens/eachpoast.dart';
import '../apicore/api.dart';
import '../models/post.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PostService _postService = PostService();
  List<Post> _posts = [];
  List<Post> _filteredPosts = [];
  bool _isLoading = true;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    try {
      List<Post> posts = await _postService.fetchPosts();
      setState(() {
        _posts = posts;
        _filteredPosts = posts;
        _isLoading = false;
      });
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  void _searchPosts(String query) async {
    setState(() {
      _searchQuery = query;
    });
    if (query.isNotEmpty) {
      try {
        List<Post> posts = await _postService.searchPosts(query);
        setState(() {
          _filteredPosts = posts;
        });
      } catch (e) {
        // Handle error
        print(e);
      }
    } else {
      setState(() {
        _filteredPosts = _posts;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFD7),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFD7),
        surfaceTintColor: Color(0xFFFFFFD7),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back)),
        title: Text('Home',style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                onChanged: _searchPosts,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 2, // Adjust thickness if needed
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Posts',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 2, // Adjust thickness if needed
                ),
              ),
            ],
          ),
          // Expanded ensures that the ListView occupies remaining space
          _isLoading
              ? Expanded(child: Center(child: CircularProgressIndicator()))
              : Expanded(
            child: ListView.builder(
              itemCount: _filteredPosts.length,
              itemBuilder: (context, index) {
                final post = _filteredPosts[index];
                return ListTile(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (c){
                          return PostDetailsScreen(post: post);
                        })
                    );
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Text(
                      post.id.toString(),
                      style: TextStyle(color: Color(0xFFFFFFD7)),
                    ),
                  ),
                  title: Text(post.title),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

