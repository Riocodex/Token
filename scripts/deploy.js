const hre = require("hardhat");

async function main(){
    const RioToken = await hre.ethers.getContractFactory("RioToken");
    const rioToken = await RioToken.deploy(100000000, 50);

    await rioToken.deployed();

    console.log("Rio Token deployed @ ",rioToken.address);
}


main().catch((error) =>{
    console.error(error);
    process.exitCode=1;
  });