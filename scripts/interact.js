const { ethers } = require("hardhat");

async function sendTokens() {
  // Replace with your contract address and private key
  const contractAddress = process.env.CONTRACT_ADDRESS;
  const privateKey = process.env.PRIVATE_KEY;

  // Connect to the deployed contract
  const Trailblaze = await ethers.getContractFactory("Trailblaze");
  const trailblazeContract = Trailblaze.attach(contractAddress);

  // Replace with your wallet address
  const toAddress = "0xfb3131da44E49C060fc15FfaA9d8c54412C1468A";

  // Mint 1 token to the specified wallet
  const amount = 1; // Assuming 18 decimals

  // Send transaction
  const tx = await trailblazeContract.mintTokens(toAddress, amount);

  // Wait for the transaction to be mined
  await tx.wait();

  console.log(`1 token sent to ${toAddress}`);
}

// Run the function
sendTokens()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
