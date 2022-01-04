pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import "./ERC223Token.sol";


/**
 * @title ERC223MintableToken
 * @dev ERC223 implementation of MintableToken.
 */
contract ERC223MintableToken is MintableToken, ERC223Token {
  /**
   * @dev Function to mint tokens. Invokes token fallback function on recipient address.
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of tokens to mint.
   * @return A boolean that indicates if the operation was successful.
   */
  function mint(
    address _to,
    uint256 _amount
  )
    hasMintPermission
    canMint
    public
    returns (bool)
  {
    bytes memory empty;
    totalSupply_ = totalSupply_.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    if (_to.isContract()) {
      ERC223Receiver receiver = ERC223Receiver(_to);
      receiver.tokenFallback(address(this), _amount, empty);
    }
    emit Mint(_to, _amount);
    emit Transfer(
      msg.sender,
      _to,
      _amount,
      empty
    );
    return true;
  }
}
