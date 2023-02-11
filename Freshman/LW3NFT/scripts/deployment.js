


const {ethers} = require("hardhat");
async function main(){
    const cntrct = await ethers.getContractFactory("LW3NFT");
    const dplyContrct = await cntrct.deploy();
    await dplyContrct.deployed();
    console.log(`NFT deployed to ${dplyContrct.address}`);
}

main()
    .then(() => {
        process.exit(0);
    })
    .catch((error) => {
        console.error(error);
        process.exit(1);
    })