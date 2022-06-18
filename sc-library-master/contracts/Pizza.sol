pragma solidity ^0.4.0;

import "./Checkable.sol";

contract Pizza is Checkable {
    address private user;
    address private pizza;
    bytes32 private hash;
    uint64 private dueDate;

    function Pizza(address _user, address _pizza, bytes32 _hash, uint _intervalSeconds) public payable {
        require(msg.value != 0);
        require(_user != 0);
        require(_pizza != 0);
        user = _user;
        pizza = _pizza;
        hash = _hash;
        dueDate = uint64(block.timestamp + _intervalSeconds);
    }

    function internalCheck() internal returns (bool) {
        return this.balance != 0 && block.timestamp > dueDate;
    }

    function internalAction() internal {
        user.transfer(this.balance);
    }

    function hotPizza(uint _code, uint _salt) external onlyService {
        require(this.balance != 0);
        bytes32 pizzaHash = keccak256(_code, _salt);
        require(pizzaHash == hash);

        if (block.timestamp <= dueDate) {
            pizza.transfer(this.balance);
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
