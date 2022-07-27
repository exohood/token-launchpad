pragma solidity ^0.4.16;

import "./lib/oraclizeAPI.sol";
import "./lib/strings.sol";

import "./LastWillOraclizeProxyI.sol";

contract LastWillOraclizeProxy is usingOraclize, LastWillOraclizeProxyI {
    using strings for *;

    /**
     * Oraclize query ids.
     */
    mapping(bytes32 => function (bool) external) private validIds;

    /**
     * To inform LastWill system about latest oraclize price in wei.
     */
    event Price(uint);

    function getPrice() returns (uint) {
        return oraclize_getPrice("URL");
    }

    function query(
        address target,
        uint startBlock,
        uint endBlock,
        function (bool) external callback
    ) public payable returns (bool) {
        string memory url = buildUrl(target, startBlock, endBlock);
        bytes32 queryId = oraclize_query("URL", url);
        if (queryId == 0) {
            return false;
        }
        validIds[queryId] = callback;
        return true;
    }

    /**
     * The result look like '["1469624867", "1469624584",...'
     */
    function __callback(bytes32 queryId, string result, bytes) {
        if (msg.sender != oraclize_cbAddress()) revert();
        function (bool wasTransactions) external callback = validIds[queryId];
        delete validIds[queryId];
        // empty string means not transaction timestamps (no output transaction)
        callback(bytes(result).length != 0);
    }

    /************************** Internal **************************/

    // json(https://api.etherscan.io/api?module=account&action=txlist&address=0xddbd2b932c763ba5b1b7ae3b362eac3e8d40121a&startblock=0&endblock=99999999&page=0&offset=0&sort=desc&apikey=FJ39P2DIU8IX8U9N2735SUKQWG3HPPGPX8).result[?(@.from=='<address>')].timeStamp
    function buildUrl(address target, uint startBlock, uint endBlock) internal constant returns (string) {
        strings.slice memory strAddress = toHex(target).toSlice();
        uint8 i = 0; // count of the strings below
        var parts = new strings.slice[](9);
        parts[i++] = "json(https://api.etherscan.io/api?module=account&action=txlist&address=0x".toSlice();
        parts[i++] = strAddress;
        //     // &page=0&offset=0 - means not pagination, but it might be a problem if there will be page limit
        parts[i++] = "&startblock=".toSlice();
        parts[i++] = uint2str(startBlock).toSlice();
        parts[i++] = "&endblock=".toSlice();
        parts[i++] = uint2str(endBlock).toSlice();
        parts[i++] = "&sort=desc&apikey=FJ39P2DIU8IX8U9N2735SUKQWG3HPPGPX8).result[?(@.from=='0x".toSlice();
        parts[i++] = strAddress;
        parts[i++] = "')].timeStamp".toSlice();
        return "".toSlice()
                 .join(parts);
    }

    /**
     * This method is useful when we need to know last transaction ts
     */
    function parseJsonArrayAndGetFirstElementAsNumber(string json) internal constant returns (uint) {
        var jsonSlice = json.toSlice();
        strings.slice memory firstResult;
        jsonSlice.split(", ".toSlice(), firstResult);
        var ts = firstResult.beyond("[\"".toSlice()).toString();
        return parseInt(ts);
    }

    function toHex(address adr) internal constant returns (string) {
        var ss = new bytes(40);
        for (uint i = 0; i < 40; i ++) {
            uint c;
            assembly {
                c := and(adr, 0xf)
                adr := div(adr, 0x10)
                c := add(add(c, 0x30), mul(0x27, gt(c, 9)))
            }
            ss[39-i] = byte(c);
        }
        return string(ss);
    }
}
