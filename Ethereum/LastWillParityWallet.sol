pragma solidity ^0.4.16;

import "./parity/WalletAbi.sol";
import "./LastWillWallet.sol";


contract LastWillParityWallet is WalletAbi, LastWillWallet {
    function LastWillParityWallet(address _targetUser, address[] _recipients, uint[] _percents, uint64 _noActivityPeriod)
            LastWillWallet(_targetUser, _recipients, _percents, _noActivityPeriod) {
    }

    // the number of owners that must confirm the same operation before it is run.
    function m_required() public constant returns (uint) {
        return 1;
    }
    // pointer used to find a free slot in m_owners
    function m_numOwners() public constant returns (uint) {
        return 1;
    }

    function m_dailyLimit() public constant returns (uint) {
        return 0;
    }

    function m_spentToday() public constant returns (uint) {
        return 0;
    }

    function m_lastDay() public constant returns (uint) {
        return block.timestamp;
    }

    // Revokes a prior confirmation of the given operation
    function revoke(bytes32) onlyTarget external {}

    // Replaces an owner `_from` with another `_to`.
    function changeOwner(address _from, address _to) onlyTarget external {
        require(_from == targetUser);
        targetUser = _to;
    }

    function addOwner(address) onlyTarget external {
        revert();
    }

    function removeOwner(address) onlyTarget external {
        revert();
    }

    function changeRequirement(uint) onlyTarget external {
        revert();
    }

    function isOwner(address _addr) constant returns (bool) {
        return _addr == targetUser;
    }

    // Gets an owner by 0-indexed position (using numOwners as the count)
    function getOwner(uint ownerIndex) constant returns (address) {
        if (ownerIndex > 0) {
            return 0;
        }
        return targetUser;
    }

    function hasConfirmed(bytes32, address) external constant returns (bool) {
        return true;
    }

    // (re)sets the daily limit. needs many of the owners to confirm. doesn't alter the amount already spent today.
    function setDailyLimit(uint) onlyTarget external {
        revert();
    }

    function execute(address _to, uint _value, bytes _data) onlyTarget external returns (bytes32 o_hash) {
        sendFundsInternal(_value, _to, _data);
        return sha3(msg.data, block.number);
    }

    function confirm(bytes32) onlyTarget returns (bool o_success) {
        return true;
    }
}
