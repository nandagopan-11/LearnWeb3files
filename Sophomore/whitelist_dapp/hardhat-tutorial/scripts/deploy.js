
//importing a special verson of ethers from Hardhat
const {ethers} = require("hardhat");

async function main(){
  
  //creating an istance of Whitelist.sol and storing it in 'whitelistContract'
  const whitelistContract = await ethers.getContractFactory("Whitelist");

  //calling the deploy method with constructor argument
  const deployedWhitelistContract = await whitelistContract.deploy(15);

  //waiting till the contract gets deployed
  await deployedWhitelistContract.deployed();

  //printing ut the address of the depoyed contract
  console.log("Whitelist contract address : " , deployedWhitelistContract.address);

}

main()
.then(() => process.exit(0))
.catch((error) => {
  console.error(error);
  process.exit(1);
});