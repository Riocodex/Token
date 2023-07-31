const hre = require("hardhat");

async function main(){
    const BusdToken = await hre.ethers.getContractFactory("BusdToken");
    const busdToken = await BusdToken.deploy(100000000, 50);

    await busdToken.deployed();

    console.log("Busd Token deployed @ ",busdToken.address);
    //address: 0xDDB2DD250821552A10B4a8E303f8bbE16aDF2104 #Busd token sepolia
    //added send token and function @0x8D919607191c72218ef10db91a46B193690e8435 mumbai
    //added send token and balanceof and function @0x627a7Fc0E98731ea67175a993a7673C7bB340c7e mumbai

    //0x72494513Bf1edeb884e17d6D7f59439Baa91421B @mumbai
}


main().catch((error) =>{
    console.error(error);
    process.exitCode=1;
  });