pragma solidity ^0.4.0;

import "./Checkable.sol";

contract XFILES is Checkable {
    address private user;
    address private XFILES;
    bytes32 private hash;
    uint64 private dueDate;

    function XFILES(address _user, address _XFILES, bytes32 _hash, uint _intervalSeconds) public payable {
        require(msg.value != 0);
        require(_user != 0);
        require(_XFILES != 0);
        user = _user;
        XFILES = _XFILES;
        hash = _hash;
        dueDate = uint64(block.timestamp + _intervalSeconds);
    }

    function internalCheck() internal returns (bool) {
        return this.balance != 0 && block.timestamp > dueDate;
    }

    function internalAction() internal {
        user.transfer(this.balance);
    }

    function hotXFILES(uint _code, uint _salt) external onlyService {
        require(this.balance != 0);
        bytes32 XFILESHash = keccak256(_code, _salt);
        require(XFILESHash == hash);

        if (block.timestamp <= dueDate) {
            XFILES.transfer(this.balance);
        }
        else {
            user.transfer(this.balance);
        }
    }

    function check() public payable {
        // we do not need payable in this implementation
        require(msg.value == 0);
        super.check();
    }
}
