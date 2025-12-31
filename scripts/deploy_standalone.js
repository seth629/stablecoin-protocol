import { ethers } from "ethers";
import fs from "fs";
import dotenv from "dotenv";
dotenv.config();

async function main() {
    const provider = new ethers.JsonRpcProvider("https://rpc.scroll.io");
    const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);
    console.log("Deploying with account:", wallet.address);

    const abi = JSON.parse(fs.readFileSync("./artifacts/Stablecoin_abi.json", "utf8"));
    let bytecode = fs.readFileSync("./artifacts/Stablecoin_bytecode.txt", "utf8").trim();
    
    // Ensure bytecode is valid hex and starts with 0x
    if (!bytecode.startsWith("0x")) {
        bytecode = "0x" + bytecode;
    }

    const factory = new ethers.ContractFactory(abi, bytecode, wallet);
    
    console.log("Deploying USDSK...");
    const contract = await factory.deploy(wallet.address, wallet.address);
    
    console.log("Waiting for deployment...");
    await contract.waitForDeployment();
    
    const address = await contract.getAddress();
    console.log("USDSK deployed to:", address);
}

main().catch((error) => {
    console.error(error);
    process.exit(1);
});
