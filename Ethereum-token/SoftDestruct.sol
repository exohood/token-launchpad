pragma solidity ^0.4.21;

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

    function SoftDestruct(address _targetUser) {
        assert(_targetUser != 0x0);
        targetUser = _targetUser;
    }

    /**
     * Kill the contract and return funds to the target user.
     */
    function kill() onlyTarget onlyAlive public {
        destroyed = true;
        if (this.balance == 0) {
            return;
        }
        targetUser.transfer(this.balance);
    }

    /**
     * Accept ether only of alive.
     */
    function () payable onlyAlive {}

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
