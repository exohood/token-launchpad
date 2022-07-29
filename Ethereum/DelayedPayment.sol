pragma solidity ^0.4.21;

import "./SoftDestruct.sol";
import "./Checkable.sol";

contract DelayedPayment is SoftDestruct, Checkable {
    // Occurs when contract was killed.
    event Killed(bool byUser);

    uint64 public actionTime;
    address public beneficiary;
    uint public amountLimit;

    event FundsSent(address to, uint amount);

    function DelayedPayment(address _targetUser, address _beneficiary, uint _amountLimit, uint _actionTime) public
            SoftDestruct(_targetUser) {
        beneficiary = _beneficiary;
        actionTime = uint64(_actionTime);
        amountLimit = _amountLimit;
    }

    function internalCheck() internal returns (bool) {
        bool result = actionTime <= block.timestamp;
        Checked(result);
        // actionTime in the past
        return result;
    }

    function internalAction() internal {
        uint amount = this.balance;
        uint change = 0;
        // check if balance more then limit; init change
        if (amount > amountLimit) {
            change = amount - amountLimit;
            amount = amountLimit;
        }

        // send contract funds
        if (amount != 0) {
            FundsSent(beneficiary, amount);
            beneficiary.transfer(amount);
        }

        // send change
        if (change != 0) {
            FundsSent(targetUser, change);
            targetUser.transfer(change);
        }
    }

    /**
     * Extends super method to add event producing.
     */
    function kill() public {
        super.kill();
        Killed(true);
    }
}
