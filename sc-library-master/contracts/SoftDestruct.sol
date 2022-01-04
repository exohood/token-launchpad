pragma solidity ^0.4.23;


/**
 * Base logic for "soft" destruct contract. In other words - to return funds to the target user.
 */
contract SoftDestruct {
  /**
   * Target user, who will received funds in case of soft destruct.
   */
  address public targetUser;

  /**
   * Flag means that this contract is already destroyed.
   */
  bool private destroyed = false;

  constructor(address _targetUser) public {
    assert(_targetUser != address(0));
    targetUser = _targetUser;
  }

  /**
   * Accept ether only of alive.
   */
  function() public payable onlyAlive {}

  /**
   * Kill the contract and return funds to the target user.
   */
  function kill() public onlyTarget onlyAlive {
    destroyed = true;
    if (address(this).balance == 0) {
      return;
    }
    targetUser.transfer(address(this).balance);
  }

  function isTarget() internal view returns (bool) {
    return targetUser == msg.sender;
  }

  function isDestroyed() internal view returns (bool) {
    return destroyed;
  }

  // ------------ MODIFIERS -----------
  /**
   * @dev Check that contract is not destroyed.
   */
  modifier onlyAlive() {
    require(!destroyed);
    _;
  }

  /**
   * @dev Check that msg.sender is target user.
   */
  modifier onlyTarget() {
    require(isTarget());
    _;
  }
}
