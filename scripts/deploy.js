const { ethers } = require('hardhat');

async function main() {
  try {
    const Trailblaze = await ethers.getContractFactory("Trailblaze");


    const trail_instance = await Trailblaze.deploy(1000 * (10 ** 9));


    console.log("Deploying Trailblaze contract...");


    console.log("Transaction Receipt:", trail_instance.deployTransaction);

    console.log("Contract deployed to address:", trail_instance.target);
  } catch (error) {
    console.error("Error deploying contract:", error);
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
