# MyNFT Contract Documentation

## Overview

The `MyNFT` contract is an ERC721 token contract that allows the minting of non-fungible tokens (NFTs). It includes functionality for managing a whitelist, allowing only specific wallet addresses to mint NFTs during the initial phase.

## Contract Details

- SPDX-License-Identifier: MIT
- Solidity Version: ^0.8.0
- Imports:
  - `Ownable` from "@openzeppelin/contracts/access/Ownable.sol"
  - `ERC721` from "@openzeppelin/contracts/token/ERC721/ERC721.sol"
  - `Counters` from "@openzeppelin/contracts/utils/Counters.sol"
  - `ERC721URIStorage` from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol"

## Contract Structure

The `MyNFT` contract inherits from `ERC721`, `ERC721URIStorage` and `Ownable`, making it an ERC721 token contract with additional ownership functionality. It uses the `Counters` library to manage token IDs.

### State Variables

- `tokenIds`: A counter for generating unique token IDs.
- `whitelist`: A mapping of wallet addresses to their whitelist status.
- `whitelistEnabled`: A boolean flag indicating whether whitelisting is enabled.

### Constructor

The constructor initializes the ERC721 token with the name "MyNFT", the symbol "NFT" and set `whitelistEnabled` = true.

### Functions

- `addToWhitelist(address _walletAddress)`: Adds a wallet address to the whitelist.
- `removeFromWhitelist(address _walletAddress)`: Removes a wallet address from the whitelist.
- `isWhitelisted(address _walletAddress)`: Checks if a wallet address is whitelisted.
- `enableWhitelisting()`: Enables whitelisting functionality.
- `disableWhitelisting()`: Disables whitelisting functionality.
- `isWhitelistingEnabled()`: Checks if whitelisting is enabled.
- `mintNFT()`: Mints a new NFT to the caller's address, if whitelisting is disabled or the caller's address is whitelisted.

## Usage

1. Deploy the `MyNFT` contract.
2. Optionally, use the `addToWhitelist` and `removeFromWhitelist` functions to manage the whitelist of wallet addresses.
3. Use the `enableWhitelisting` and `disableWhitelisting` functions to enable or disable whitelisting functionality.
4. Call the `isWhitelisted` function to check if a specific wallet address is whitelisted.
5. Call the `isWhitelistingEnabled` function to check if whitelisting is currently enabled.
6. Call the `mintNFT` function to mint a new NFT to the caller's address, if whitelisting is disabled or the caller's address is whitelisted.

## Contract deployed to Mumbai testnet:

Contract address: 0x279eC864c7FD3e5ACcc964DCBD0754b55DCDC5AC

Link: https://mumbai.polygonscan.com/address/0x279eC864c7FD3e5ACcc964DCBD0754b55DCDC5AC
