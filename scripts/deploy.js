import hre from "hardhat";

async function main() {
  // Accessing ethers from hre
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const Stablecoin = await hre.ethers.getContractFactory("Stablecoin");
  const stablecoin = await Stablecoin.deploy(deployer.address, deployer.address);

  await stablecoin.waitForDeployment();

  console.log("USDSK deployed to:", await stablecoin.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
