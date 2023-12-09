const dotenv = require('dotenv');
const fs = require('fs');

dotenv.config(); // Load environment variables from .env file

async function loadContract() {
  try {
    // Try to read the contract address from the .env file
    const contractAddress = process.env.CONTRACT_ADDRESS;

    if (!contractAddress) {
      console.error("No contract address found in the .env file.");
      process.exit(1);
    }

    const Trailblaze = await ethers.getContractFactory("Trailblaze");
    return Trailblaze.attach(contractAddress);
  } catch (error) {
    console.error("Error reading contract address:", error);
    process.exit(1);
  }
}

async function testBalance() {
  const trailblazeInstance = await loadContract();

  // Mint 1000 tokens
  await trailblazeInstance.mintTokens('0xfb3131da44E49C060fc15FfaA9d8c54412C1468A', 1000);

  const balance = await trailblazeInstance.balanceOf('0xfb3131da44E49C060fc15FfaA9d8c54412C1468A');
  console.log("Token balance:", balance.toString());
}

testBalance().then(() => process.exit(0)).catch((error) => {
  console.error(error);
  process.exit(1);
});