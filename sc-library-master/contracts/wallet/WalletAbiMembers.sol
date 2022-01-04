pragma solidity ^0.4.23;

import "./WalletAbi.sol";


/**
 * @title WalletAbiMembers.
 * @dev Implements m_* functions with default values.
 */
contract WalletAbiMembers is WalletAbi {
  uint public m_required = 1; //solium-disable-line mixedcase
  uint public m_numOwners = 1; //solium-disable-line mixedcase
  uint public m_dailyLimit = 0; //solium-disable-line mixedcase
  uint public m_spentToday = 0; //solium-disable-line mixedcase

  // solium-disable-next-line mixedcase
  function m_lastDay() public view returns (uint) {
    return block.timestamp;
  }
}
