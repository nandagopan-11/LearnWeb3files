
require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config({ path: ".env" });

const ALCHEMY_HTTP_URL = process.env.ALCHEMY_HTTP_URL;
const GOERLI_PVT_KEY = process.env.GOERLI_PVT_KEY;

module.exports ={
  solidity : "0.8.4",
  networks : {
    goerli : {
      url : ALCHEMY_HTTP_URL,
      accounts : [GOERLI_PVT_KEY],
    },
  },
};