pragma solidity ^0.4.21;

import "./SoftDestruct.sol";
import "./Checkable.sol";

/**
 * The base LastWill contract. Check method must be overridden.
 */
contract LastWill is SoftDestruct, Checkable {
    struct RecipientPercent {
        address recipient;
        uint8 percent;
    }
    /**
     * Recipient addresses and corresponding % of funds.
     */
    RecipientPercent[] private percents;

    // ------------ EVENTS ----------------
    // Occurs when contract was killed.
    event Killed(bool byUser);
    // Occurs when founds were sent.
    event FundsAdded(address indexed from, uint amount);
    // Occurs when accident leads to sending funds to recipient.
    event FundsSent(address recipient, uint amount, uint percent);

    // ------------ CONSTRUCT -------------
    function LastWill(address _targetUser, address[] _recipients, uint[] _percents) public
            SoftDestruct(_targetUser) {
        require(_recipients.length == _percents.length);
        percents.length = _recipients.length;
        // check percents
        uint summaryPercent = 0;
        for (uint i = 0; i < _recipients.length; i ++) {
            address recipient = _recipients[i];
            uint percent = _percents[i];

            require(recipient != 0x0);
            summaryPercent += percent;
            percents[i] = RecipientPercent(recipient, uint8(percent));
        }
        require(summaryPercent == 100);
    }

    /**
     * Limit check execution only for alive contract.
     */
    function check() onlyAlive payable public {
        super.check();
    }

    // ------------ FALLBACK -------------
    // Must be less than 2300 gas
    function() payable onlyAlive() notTriggered {
        FundsAdded(msg.sender, msg.value);
    }

    // ------------ INTERNAL -------------
    /**
     * Calculate amounts to transfer corresponding to the percents.
     */
    function calculateAmounts(uint balance, uint[] amounts) internal view
                    returns (uint change) {
        change = balance;
        for (uint i = 0; i < percents.length; i ++) {
            uint amount = balance * percents[i].percent / 100;
            amounts[i] = amount;
            change -= amount;
        }
    }

    /**
     * Distribute funds between recipients in corresponding by percents.
     */
    function distributeFunds() internal {
        uint[] memory amounts = new uint[](percents.length);
        uint change = calculateAmounts(this.balance, amounts);

        for (uint i = 0; i < amounts.length; i ++) {
            uint amount = amounts[i];
            address recipient = percents[i].recipient;
            uint percent = percents[i].percent;

            if (amount == 0) {
                continue;
            }

            recipient.transfer(amount + change);
            FundsSent(recipient, amount, percent);
        }
    }

    /**
     * @dev Do inner action if check was success.
     */
    function internalAction() internal {
        distributeFunds();
    }

    /**
     * Extends super method to add event producing.
     */
    function kill() public {
        super.kill();
        Killed(true);
    }
}
