// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

/**
 * @title Stablecoin (USDSK)
 * @dev Implementation of a professional stablecoin similar to USDC.
 * Features: Minting, Burning, Pausing, and Access Control.
 */
contract Stablecoin is ERC20, ERC20Burnable, AccessControl, ERC20Permit {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

    bool public paused = false;

    event Paused(address account);
    event Unpaused(address account);

    constructor(address defaultAdmin, address minter)
        ERC20("Simon Stablecoin K", "USDSK")
        ERC20Permit("Simon Stablecoin K")
    {
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _grantRole(MINTER_ROLE, minter);
        _mint(defaultAdmin, 1000000 * 10 ** decimals());
    }

    modifier whenNotPaused() {
        require(!paused, "Stablecoin: paused");
        _;
    }

    function pause() public onlyRole(PAUSER_ROLE) {
        paused = true;
        emit Paused(msg.sender);
    }

    function unpause() public onlyRole(PAUSER_ROLE) {
        paused = false;
        emit Unpaused(msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) whenNotPaused {
        _mint(to, amount);
    }

    // Overriding decimals to match USDC (6 decimals)
    function decimals() public view virtual override returns (uint8) {
        return 6;
    }

    // Internal hook for pause functionality
    function _update(address from, address to, uint256 value)
        internal
        virtual
        override
        whenNotPaused
    {
        super._update(from, to, value);
    }
}
