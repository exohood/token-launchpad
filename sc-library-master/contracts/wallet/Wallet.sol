pragma solidity ^0.4.23;

import "./WalletEvents.sol";
import "./WalletAbiMembers.sol";
import "./WalletAbiFunctions.sol";


/**
 * @title Wallet.
 * @dev Extends WalletEvents, WalletAbiMembers and WalletAbiFunctions.
 */
contract Wallet is WalletEvents, WalletAbiMembers, WalletAbiFunctions {
  /**
   * @dev Function executed on wallet transfer event.
   *
   * @param _to     Funds receiver.
   * @param _value  Amount of funds will beneficiary receive.
   * @param _data   Call metadata.
   */
  function execute(address _to, uint _value, bytes _data) external returns (bytes32);
}
