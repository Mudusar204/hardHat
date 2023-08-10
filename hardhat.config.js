require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */

const GANACHE_URL = "HTTP://127.0.0.1:7545"; 

const account_Private_Key = "0x6f392e4cbfe8c947d9c2b5509452a84323419b18798301c56da2d3dcb82bdf94";

module.exports = {
  solidity: "0.8.19",
  networks: {
    ganache: {
      url: GANACHE_URL,
      accounts: [account_Private_Key],
    },
  },
};
