pragma solidity ^0.4.21;

import "./LastWill.sol";
import "./ERC20Wallet.sol";

contract LastWillWallet is LastWill, ERC20Wallet {

    uint64 public lastOwnerActivity;
    uint64 public noActivityPeriod;

    event Withdraw(address _sender, uint amount, address _beneficiary);

    function LastWillWallet(address _targetUser, address[] _recipients, uint[] _percents, uint64 _noActivityPeriod) public
        LastWill(_targetUser, _recipients, _percents) {

        noActivityPeriod = _noActivityPeriod;
        lastOwnerActivity = uint64(block.timestamp);
    }

    function check() public payable {
        // we really do not need payable in this implementation
        require(msg.value == 0);
        super.check();
    }

    function internalCheck() internal returns (bool) {
        bool result = block.timestamp > lastOwnerActivity && (block.timestamp - lastOwnerActivity) >= noActivityPeriod;
        Checked(result);
        return result;
    }

    function sendFunds(uint _amount, address _receiver, bytes _data) onlyTarget onlyAlive external {
        sendFundsInternal(_amount, _receiver, _data);
    }

    function sendFunds(uint _amount, address _receiver) onlyTarget onlyAlive external {
        sendFundsInternal(_amount, _receiver, "");
    }

    function tokenTransfer(address _token, address _to, uint _value) onlyTarget public returns (bool success) {
        updateLastActivity();
        return super.tokenTransfer(_token, _to, _value);
    }

    function tokenTransferFrom(address _token, address _from, address _to, uint _value) onlyTarget public returns (bool success) {
        updateLastActivity();
        return super.tokenTransferFrom(_token, _from, _to, _value);
    }

    function tokenApprove(address _token, address _spender, uint256 _value) onlyTarget public returns (bool success) {
        updateLastActivity();
        return super.tokenApprove(_token, _spender, _value);
    }

    function updateLastActivity() internal {
        lastOwnerActivity = uint64(block.timestamp);
    }

    function sendFundsInternal(uint _amount, address _receiver, bytes _data) internal {
        require(this.balance >= _amount);
        require(_receiver != 0);
        if (_data.length == 0) {
            require(_receiver.send(_amount));
        }
        else {
            require(_receiver.call.value(_amount)(_data));
        }

        Withdraw(msg.sender, _amount, _receiver);
        updateLastActivity();
    }
}
