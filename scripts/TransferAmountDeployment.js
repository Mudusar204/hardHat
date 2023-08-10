async function main() {
    // const [deployer] = await ethers.getSigners();
  
    // console.log(deployer,"Deploying contracts with the account:", deployer.address);
  
    const transferAmount = await ethers.deployContract("TransferAmount");
  
    console.log(transferAmount,"Token address:", await transferAmount.getAddress());
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });