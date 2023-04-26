const hre = require("hardhat");

async function main(){
    const Faucet = await hre.ethers.getContractFactory("RioToken");
    const faucet = await Faucet.deploy("0x90d61929B89441113fa06DC1B74Df2eAc877e9e9");

    await faucet.deployed();

    console.log("faucet contract deployed @ ",faucet.address);
    //address: 0xAa62D1413022D26ee1a96ADdb6fBf843B86Ff1c3
}


main().catch((error) =>{
    console.error(error);
    process.exitCode=1;
  });