//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract DecentralizedSocial {
    // Create sample post struct
    struct Post {
        string content;
        address poster;
        uint timestamp;
        uint upvotes;
        uint downvotes;
        uint id;
    }

    // Storage variables and blank constructor
    Post[] public allPosts;
    mapping(address => Post[]) public allUserToPosts;
    uint16 numPosts;

    // Create post
    function createPost(string memory _content) public {
        Post memory newPost = Post(_content, msg.sender, block.timestamp, 0, 0, numPosts);
        allUserToPosts[msg.sender].push(newPost);
        allPosts.push(newPost);
        numPosts++;
    }

    // Return all posts
    function getAllPosts() public view returns (Post[] memory) {
        return allPosts;
    }

    // Get all posts for a specific user
    function getAllPostsForAUser(address _user) public view returns (Post[] memory) {
        return allUserToPosts[_user];
    }

    // Get post by a specific user and ID
    function getPostByUserID(uint _index) public view returns (Post memory) {
        assert(_index < numPosts);
        Post memory userPost = allUserToPosts[msg.sender][_index];
        return userPost;
    }

    /*
    * Upvoting and Downvoting Posts
    */
    function upvotePost(uint _index) public view {
        Post memory currentPost = allPosts[_index];
        currentPost.upvotes++;
    }

    function downvotePost(uint _index) public view {
        Post memory currentPost = allPosts[_index];
        currentPost.downvotes++;
    }
}
