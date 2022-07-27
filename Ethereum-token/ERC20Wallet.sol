pragma solidity ^0.4.16;

import "./token/ERC20.sol";

contract ERC20Wallet {
    function tokenBalanceOf(address _token) constant returns (uint) {
        return ERC20(_token).balanceOf(this);
    }

    function tokenTransfer(address _token, address _to, uint _value) returns (bool success) {
        return ERC20(_token).transfer(_to, _value);
    }

    function tokenTransferFrom(address _token, address _from, address _to, uint _value) returns (bool success) {
        return ERC20(_token).transferFrom(_from, _to, _value);
    }

    function tokenApprove(address _token, address _spender, uint256 _value) returns (bool success) {
        return ERC20(_token).approve(_spender, _value);
    }

    function tokenAllowance(address _token, address _owner, address _spender) constant returns (uint remaining) {
        return ERC20(_token).allowance(_owner, _spender);
    }
}
