pragma solidity ^0.4.23;

import "./WalletAbi.sol";
import "../SoftDestruct.sol";


/**
 * @title WalletAbiFunctions.
 * @dev Implements all functions extends m_* and execute with default values.
 */
contract WalletAbiFunctions is WalletAbi, SoftDestruct {
  // Revokes a prior confirmation of the given operation
  function revoke(bytes32) external onlyTarget {}

  // Replaces an owner `_from` with another `_to`.
  function changeOwner(address _from, address _to) external onlyTarget {
    require(_from == targetUser);
    targetUser = _to;
  }

  function addOwner(address) external onlyTarget {
    revert();
  }

  function removeOwner(address) external onlyTarget {
    revert();
  }

  function changeRequirement(uint) external onlyTarget {
    revert();
  }

  // (re)sets the daily limit. needs many of the owners to confirm. doesn't alter the amount already spent today.
  function setDailyLimit(uint) external onlyTarget {
    revert();
  }

  function hasConfirmed(bytes32, address) external view returns (bool) {
    return true;
  }

  function confirm(bytes32) public onlyTarget returns (bool) {
    return true;
  }

  function isOwner(address _address) public view returns (bool) {
    return targetUser == _address;
  }

  // Gets an owner by 0-indexed position (using numOwners as the count)
  function getOwner(uint ownerIndex) public view returns (address) {
    if (ownerIndex > 0) {
      return 0;
    }
    return targetUser;
  }
}
