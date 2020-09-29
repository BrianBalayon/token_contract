pragma solidity ^0.6.2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.1/contracts/presets/ERC20PresetMinterPauser.sol";

contract Test_Tkn_A is ERC20 {

    constructor () public ERC20("Test Token A", "TTA") {
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
}
