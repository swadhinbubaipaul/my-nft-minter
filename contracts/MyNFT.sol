// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private tokenIds;

    mapping(address => bool) private whitelist;
    bool private whitelistEnabled;

    constructor() ERC721("MyNFT", "NFT") {
        whitelistEnabled = true;
    }

    function addToWhitelist(address _walletAddress) public onlyOwner {
        whitelist[_walletAddress] = true;
    }

    function removeFromWhitelist(address _walletAddress) public onlyOwner {
        whitelist[_walletAddress] = false;
    }

    function isWhitelisted(address _walletAddress) public view returns (bool) {
        return whitelist[_walletAddress];
    }

    function enableWhitelisting() public onlyOwner {
        whitelistEnabled = true;
    }

    function disableWhitelisting() public onlyOwner {
        whitelistEnabled = false;
    }

    function isWhitelistingEnabled() public view returns (bool) {
        return whitelistEnabled;
    }

    function mintNFT(string memory tokenUri) public {
        require(
            !whitelistEnabled || isWhitelisted(msg.sender),
            "Address not whitelisted"
        );
        uint256 tokenId = tokenIds.current();
        tokenIds.increment();
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, tokenUri);
    }

    // The following functions are overrides required by Solidity.

    function _burn(
        uint256 tokenId
    ) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(
        uint256 tokenId
    ) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
