pragma solidity ^0.4.23;

import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/BurnableToken.sol";
import "openzeppelin-solidity/contracts/lifecycle/Pausable.sol";
import "./FreezableMintableToken.sol";
import "./Consts.sol";


contract MainToken is Consts, FreezableMintableToken, BurnableToken, Pausable {
    event Initialized();
    bool public initialized = false;

    constructor() public {
        init();
        transferOwnership(TARGET_USER);
    }

    function name() public pure returns (string) {
        return TOKEN_NAME;
    }

    function symbol() public pure returns (string) {
        return TOKEN_SYMBOL;
    }

    function decimals() public pure returns (uint8) {
        return TOKEN_DECIMALS_UINT8;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool _success) {
        require(!paused);
        return super.transferFrom(_from, _to, _value);
    }

    function transfer(address _to, uint256 _value) public returns (bool _success) {
        require(!paused);
        return super.transfer(_to, _value);
    }

    function init() private {
        require(!initialized);
        initialized = true;

        if (PAUSED) {
            pause();
        }

        //#if D_PREMINT_COUNT > 0
        address[D_PREMINT_COUNT] memory addresses = [D_PREMINT_ADDRESSES];
        uint[D_PREMINT_COUNT] memory amounts = [D_PREMINT_AMOUNTS];
        uint64[D_PREMINT_COUNT] memory freezes = [D_PREMINT_FREEZES];

        for (uint i = 0; i < addresses.length; i++) {
            if (freezes[i] == 0) {
                mint(addresses[i], amounts[i]);
            } else {
                mintAndFreeze(addresses[i], amounts[i], freezes[i]);
            }
        }
        //#endif

        if (!CONTINUE_MINTING) {
            finishMinting();
        }

        emit Initialized();
    }
}
