const hre = require("hardhat");

async function main() {
  const contractAddress = "0x72494513Bf1edeb884e17d6D7f59439Baa91421B";
  // Change the following line to match your contract's solidity file name and contract name
  const contractName = "contracts/Busd.sol:BusdToken";
  const contractArgs = [100000000, 50];
  const contract = await hre.ethers.getContractFactory(contractName);
  const verifiedContract = await hre.run("verify:verify", {
    address: contractAddress,
    contract: contractName,
    constructorArguments: contractArgs,
  });
  console.log("Contract verified:", verifiedContract);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
