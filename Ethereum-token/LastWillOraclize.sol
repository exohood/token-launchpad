pragma solidity ^0.4.16;

import "./LastWill.sol";
import "./LastWillOraclizeProxyI.sol";

contract LastWillOraclize is LastWill {
    LastWillOraclizeProxyI private proxy;
    /**
     * Period of time (in seconds) without activity.
     */
    uint32 private noActivityPeriod;
    /**
     * Last active timestamp.
     */
    uint32 private lastActiveTs;
    /**
     * Last check block number.
     */
    uint32 private lastCheckBlockNo;
    /**
     * Flag means no activity was detected for the specified period of time.
     */
    bool private noActivity = false;

    /**
     * To inform LastWill system that it should repeat check immediately.
     */
    event NeedRepeatCheck(bool isAccident);
    /**
     * To inform LastWill system about latest oraclize price in wei.
     */
    event Price(uint);

    // ------------ CONSTRUCT -------------
    function LastWillOraclize(address _targetUser, address[] _recipients, uint[] _percents, uint32 _noActivityPeriod, address _proxy) public
             LastWill(_targetUser, _recipients, _percents) {
        noActivityPeriod = _noActivityPeriod;
        proxy = LastWillOraclizeProxyI(_proxy);
        lastActiveTs = uint32(block.timestamp);
        lastCheckBlockNo = uint32(block.number);
    }

    // ------------ INTERNAL --------------
    function internalCheck() internal returns (bool) {
        if (noActivity) {
            msg.sender.transfer(msg.value);
            return true;
        }
        uint price = proxy.getPrice();
        Price(price);
        if (price > msg.value) {
            revert();
        }
        if (!proxy.query.value(price)(targetUser, lastCheckBlockNo, block.number, this.callback)) {
            revert();
        }

        uint change = msg.value - price;
        if (change != 0) {
            msg.sender.transfer(change);
        }
        return false;
    }

    function callback(bool wasTransaction) external {
        require(msg.sender == address(proxy));
        if (noActivity) return;

        if (!wasTransaction) {
            // accident if there is more time from last active then check interval
            noActivity = block.timestamp >= lastActiveTs ? (block.timestamp - lastActiveTs >= noActivityPeriod) : false;
        }
        else {
            // set not actual timestamp, but block timestamp.
            // It might cause time gap, which in worst case equals to poll interval
            lastActiveTs = uint32(block.timestamp);
        }
        Checked(noActivity);
        if (noActivity) {
            NeedRepeatCheck(true);
        }
    }
}
