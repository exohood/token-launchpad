pragma solidity ^0.4.23;

import "./ERC721/ERC721Full.sol";
import "./ERC721/ERC721Mintable.sol";
import "./ERC721/ERC721Burnable.sol";


/**
 * @dev Uses OpenZeppelin's implementation of ERC721.
 *      See https://github.com/OpenZeppelin/openzeppelin-solidity
 */
contract GameAssetsContract is ERC721Full, ERC721Mintable, ERC721Burnable {
  string public commonUri = "D_URI";

  constructor() ERC721Full("D_NAME", "D_SYMBOL") public {
    _addMinter(D_OWNER);
  }

  /**
     * @dev Function to mint tokens
     * @param to The address that will receive the minted tokens.
     * @param tokenId The token id to mint.
     * @return A boolean that indicates if the operation was successful.
     */
  function mint(address to, uint256 tokenId) public onlyMinter returns (bool) {
    _mint(to, tokenId);
    _setTokenURI(tokenId, string(abi.encodePacked(commonUri, uint2str(tokenId))));
    return true;
  }

  function uint2str(uint i) internal pure returns (string){
    if (i == 0) return "0";
    uint j = i;
    uint length;
    while (j != 0) {
      length++;
      j /= 10;
    }
    bytes memory bstr = new bytes(length);
    uint k = length - 1;
    while (i != 0) {
      bstr[k--] = byte(48 + i % 10);
      i /= 10;
    }
    return string(bstr);
  }
}
