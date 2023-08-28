require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */

const GANACHE_URL = "HTTP://127.0.0.1:7545"; 

const account_Private_Key = "0xe70914931599398b12d8e1dd36622117a8e9354cbdb79bddd1b649433c840e82";
const sepolia_Private_key ="0xb83b48612666c0770f512657df92efa1d62b7690b990236303c6e82ba685f327"
module.exports = {
  solidity: "0.8.19",
  networks: {
    ganache: {
      url: GANACHE_URL,
      accounts: [account_Private_Key],
    },
    sepolia: {
      url: "https://sepolia.infura.io/v3/26865b57594148a68791dfbc1dacde47",
// url:"https://eth-sepolia.g.alchemy.com/v2/k9vlQuyaNHemyeWdVeEXDNFeEdheFW9Z",
      accounts: [sepolia_Private_key]
    }
  },
};
