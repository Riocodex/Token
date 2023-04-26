const hre = require("hardhat");

async function main(){
    const RioToken = await hre.ethers.getContractFactory("RioToken");
    const rioToken = await RioToken.deploy(100000000, 50);

    await rioToken.deployed();

    console.log("Rio Token deployed @ ",rioToken.address);
    //address: 0xAa62D1413022D26ee1a96ADdb6fBf843B86Ff1c3
}


main().catch((error) =>{
    console.error(error);
    process.exitCode=1;
  });