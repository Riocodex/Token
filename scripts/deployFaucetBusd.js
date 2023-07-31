
//0xf723B0f912f90a4a012C2Dff5C46146f71e6aA19 @mumbai

//0xB3D471eb35Ee9B9f58C689620594301eA68E7cCC @sepolia
const hre = require("hardhat");

async function main() {
  const Faucet = await hre.ethers.getContractFactory("FaucetBusd");
  const faucet = await Faucet.deploy("0xDDB2DD250821552A10B4a8E303f8bbE16aDF2104");

  await faucet.deployed();

  console.log("Faucet contract deployed: ", faucet.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});