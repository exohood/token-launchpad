pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";


/**
 * @title ERC20Wallet.
 * @dev Contract able to manage tokens.
 */
contract ERC20Wallet {
  /**
   * @dev Shows token balance of contract.
   *
   * @param _token Address of token contract.
   */
  function tokenBalanceOf(address _token) public view returns (uint) {
    return ERC20(_token).balanceOf(this);
  }

  /**
   * @dev Transfers tokens from contract to specified address.
   *
   * @param _token  Address of token contract.
   * @param _to     Tokens receiver.
   * @param _value  Token amount to transfer.
   */
  function tokenTransfer(address _token, address _to, uint _value) public returns (bool) {
    return ERC20(_token).transfer(_to, _value);
  }

  /**
   * @dev Executes transferFrom on contract behalf.
   *
   * @param _token  Address of token contract.
   * @param _from   Tokens owner.
   * @param _to     Tokens receiver.
   * @param _value  Token amount to transfer.
   */
  function tokenTransferFrom(
    address _token,
    address _from,
    address _to,
    uint _value
  )
    public
    returns (bool)
  {
    return ERC20(_token).transferFrom(_from, _to, _value);
  }

  /**
   * @dev Executes approve on contract behalf.
   *
   * @param _token    Address of token contract.
   * @param _spender  Tokens spender.
   * @param _value    Token amount.
   */
  function tokenApprove(address _token, address _spender, uint256 _value) public returns (bool) {
    return ERC20(_token).approve(_spender, _value);
  }

  /**
   * @dev Executes allowance on contract behalf.
   *
   * @param _token    Address of token contract.
   * @param _owner    Tokens owner.
   * @param _spender  Tokens spender.
   */
  function tokenAllowance(address _token, address _owner, address _spender) public view returns (uint) {
    return ERC20(_token).allowance(_owner, _spender);
  }
}
