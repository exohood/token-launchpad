pragma solidity ^0.4.16;

/**
 * Oraclize service proxy interface.
 */
contract LastWillOraclizeProxyI {
    /**
     * Get required amount of money for the next query call.
     * @return wei
     */
    function getPrice() public returns (uint);
    /**
     * Do check query.
     * @param target User address to check.
     * @param startBlock Starts check for this block.
     * @param endBlock Latest block.
     * @param callback Callback function (bool wasTransactions),
     *                 which will be called on query result.
     * @return True if query was registered, otherwise false.
     */
    function query(
        address target,
        uint startBlock,
        uint endBlock,
        function (bool) external callback
    ) public payable returns (bool);
}
