require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.17",
  networks: {
    mumbai:{
      url: process.env.TESTNET_RPC_KEY,
      accounts:[process.env.PRIVATE_KEY]
    },
    goerli: {
      url: process.env.TESTNET_RPC_KEY,
      accounts: [process.env.PRIVATE_KEY]
    }
  },
  etherscan:{
    apiKey:process.env.POLYGONSCAN_API_KEY
  }
};