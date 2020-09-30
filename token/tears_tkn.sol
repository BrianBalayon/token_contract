pragma solidity ^0.6.2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.2.0/contracts/presets/ERC20PresetMinterPauser.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.2.0/contracts/token/ERC20/ERC20Capped.sol";

/**
 * Is both an OpenZeppelin ERC20Capped and ERC20PresetMinterPauser
 */
contract Tears_Token is ERC20Capped, ERC20PresetMinterPauser {
    event CapAmt(uint256 indexed amt);
    event Sending(uint256 indexed amt);

    /**
     * Number inspiration:
     *      The averge number of crying session in the USA in a single month is 623,580,000
     *      $750 is how much tax Trump paid in 2016... only if my annual federal tax was $750   U_U
     *
     */
    constructor()
        public
        ERC20Capped(623580000000000000000000000)
        ERC20PresetMinterPauser("Tears", "TRS")
    {
        _mint(msg.sender, 750 * (10**uint256(decimals())));
    }

    /**
     * @dev See {ERC20-_beforeTokenTransfer}.
     *
     * Requirements:
     *
     * - minted tokens must not cause the total supply to go over the cap.
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override(ERC20Capped, ERC20PresetMinterPauser) {
        ERC20PresetMinterPauser._beforeTokenTransfer(from, to, amount);
        ERC20Capped._beforeTokenTransfer(from, to, amount);
    }
}
