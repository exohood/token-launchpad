pragma solidity ^0.4.23;


//sol Wallet
// Multi-sig, daily-limited account proxy/wallet.
// @authors:
// Gav Wood <g@ethdev.com>
// inheritable "property" contract that enables methods to be protected by requiring the acquiescence of either a
// single, or, crucially, each of a number of, designated owners.
// usage:
// use modifiers onlyowner (just own owned) or onlymanyowners(hash), whereby the same hash must be provided by
// some number (specified in constructor) of the set of owners (specified in the constructor, modifiable) before the
// interior is executed.
contract WalletAbi {
  // Revokes a prior confirmation of the given operation
  function revoke(bytes32 _operation) external;

  // Replaces an owner `_from` with another `_to`.
  function changeOwner(address _from, address _to) external;

  function addOwner(address _owner) external;

  function removeOwner(address _owner) external;

  function changeRequirement(uint _newRequired) external;

  // (re)sets the daily limit. needs many of the owners to confirm. doesn't alter the amount already spent today.
  function setDailyLimit(uint _newLimit) external;

  function execute(address _to, uint _value, bytes _data) external returns (bytes32);

  function hasConfirmed(bytes32 _operation, address _owner) external view returns (bool);

  function isOwner(address _addr) public view returns (bool);

  function confirm(bytes32 _h) public returns (bool);
}
