pragma solidity ^0.4.23;


contract Consts {
    uint public constant TOKEN_DECIMALS = D_DECIMALS;
    uint8 public constant TOKEN_DECIMALS_UINT8 = D_DECIMALS;
    uint public constant TOKEN_DECIMAL_MULTIPLIER = 10 ** TOKEN_DECIMALS;

    string public constant TOKEN_NAME = "D_NAME";
    string public constant TOKEN_SYMBOL = "D_SYMBOL";
    bool public constant PAUSED = D_PAUSE_TOKENS;
    address public constant TARGET_USER = D_CONTRACTS_OWNER;
    bool public constant CONTINUE_MINTING = D_CONTINUE_MINTING;
}
