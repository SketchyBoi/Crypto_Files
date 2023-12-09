require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  defaultNetwork: "mumbai",
  networks:{
    mumbai:{
      url: "https://polygon-mumbai.g.alchemy.com/v2/U4o0DfYCPnUtz4WPSnFir-G6E_N9U7OW",
      accounts: [`0x${process.env.PRIVATE_KEY}`]
    }
  }
};
