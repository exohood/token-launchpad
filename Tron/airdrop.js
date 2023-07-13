// airdrop contract address
const airDropAddress = "0x0895F165cF9AF4c505364e2db59E098b12009768";
// token address
const tokenAddress = "0xf7EC7C07C6B85469A140d1d504Cd1FD3406bCE1e";
// management address
const fromAddress = "0x95A8E8da295958260aFdecC37Dbd37c53342B29F";


const Web3 = require('web3');
const web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
const AirDrop = require('token-launchpad/tron/AirDrop.json');
const ERC20 = require('token-launchpad/tron//ERC20.json');
const airDrop = web3.eth.contract(AirDrop.abi).at(airDropAddress);
const token = web3.eth.contract(ERC20.abi).at(tokenAddress);
