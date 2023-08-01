require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */

const GANACHE_URL = "HTTP://127.0.0.1:7545"; 

const account_Private_Key = "0x8d1cd1054c09355d6f92eb56f4837610aedc813b566f53cb3636e46e1abfeb00";

module.exports = {
  solidity: "0.8.19",
  networks: {
    ganache: {
      url: GANACHE_URL,
      accounts: [account_Private_Key],
    },
  },
};
