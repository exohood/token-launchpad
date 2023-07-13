pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "sc-library/contracts/ERC223/ERC223Receiver.sol";


contract Template is Ownable {
    ERC20 public token;
    uint public createdAt;

    constructor() public {
        owner = D_TARGET;
        token = ERC20(D_TOKEN);
        createdAt = block.number;
    }

    function transfer(address[] _addresses, uint[] _amounts) external onlyOwner {
        require(_addresses.length == _amounts.length);

        for (uint i = 0; i < _addresses.length; i ++) {
            token.transfer(_addresses[i], _amounts[i]);
        }
    }

    function transferFrom(address _from, address[] _addresses, uint[] _amounts) external onlyOwner {
        require(_addresses.length == _amounts.length);

        for (uint i = 0; i < _addresses.length; i ++) {
            token.transferFrom(_from, _addresses[i], _amounts[i]);
        }
    }

    function tokenFallback(address, uint, bytes) public pure {
        // receive tokens
    }

    function withdraw(uint _value) public onlyOwner {
        token.transfer(owner, _value);
    }

    function withdrawToken(address _token, uint _value) public onlyOwner {
        ERC20(_token).transfer(owner, _value);
    }
}
