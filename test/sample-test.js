const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("DecentralizedSocial", function () {
  it("Deploys and create a user", async function () {
    // Deploy contract
    const [owner, randomPerson] = await hre.ethers.getSigners();
    console.log(randomPerson.address);
    const Greeter = await ethers.getContractFactory("DecentralizedSocial");
    const greeter = await Greeter.deploy();
    await greeter.deployed();

    // Create post
    await greeter.createPost("This is my first Pontweet");

    // Get post by ID
    const post = await greeter.getPostByUserID(0);
    console.log(post['content']);
    //await greeter.createUser(randomPerson.address, "Other Person");
  });
});
