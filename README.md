# Stablecoin Protocol (USDSK) 🏦

A professional-grade, fiat-pegged stablecoin implementation built on **Scroll (zkEVM)**, designed to enable seamless, low-cost asset transfers across continents.

## Overview

The **Stablecoin Protocol (USDSK)** is an ERC20-compliant token optimized for the **Scroll Layer 2 network**. By leveraging zk-Rollup technology, USDSK provides a scalable and secure solution for global financial inclusion, allowing users to transfer value across borders with near-instant finality and minimal fees.

## Key Features

- **Scroll zkEVM Integration**: Optimized for high throughput and low transaction costs on the Scroll network.
- **Cross-Continent Utility**: Designed for frictionless global remittances and cross-border payments.
- **ERC20 Standard**: Fully compatible with all Ethereum and Scroll-based wallets and DeFi protocols.
- **6 Decimals**: Matches the precision of USDC for seamless integration.
- **Total Supply**: 1,000,000 USDSK (Initial Mint).
- **Access Control**: Role-based permissions for Minting, Pausing, and Administration.
- **Emergency Pause**: Ability to halt transfers in case of security threats.
- **Gasless Approvals**: Implements EIP-2612 (Permit) for better user experience.

## Deployment Details

- **Network**: Scroll Mainnet
- **Contract Address**: `0x811FF7E018bD53c5B972fe3b87c0fCed61352157`
- **Explorer**: [View on Scrollscan](https://scrollscan.com/address/0x811FF7E018bD53c5B972fe3b87c0fCed61352157)

## Smart Contract Architecture

- **`Stablecoin.sol`**: The core contract inheriting from OpenZeppelin's industry-standard libraries.
- **Roles**:
  - `DEFAULT_ADMIN_ROLE`: Can manage other roles.
  - `MINTER_ROLE`: Authorized to create new tokens.
  - `PAUSER_ROLE`: Authorized to pause/unpause the contract.

## Tech Stack

- **Language**: Solidity ^0.8.20
- **Framework**: Hardhat / Foundry
- **Libraries**: OpenZeppelin Contracts

## Getting Started

### Prerequisites

- Node.js & npm
- Hardhat

### Installation

```bash
npm install @openzeppelin/contracts
```

### Deployment

```bash
npx hardhat run scripts/deploy.js --network mainnet
```

## Security

This protocol utilizes OpenZeppelin's audited contracts to ensure the highest level of security. However, always conduct a professional audit before deploying to a production environment.

## License

MIT
