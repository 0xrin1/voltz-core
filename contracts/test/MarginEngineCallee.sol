pragma solidity ^0.8.0;
import "../MarginEngine.sol";
import "../interfaces/IMarginEngine.sol";
import "prb-math/contracts/PRBMathUD60x18Typed.sol";
import "prb-math/contracts/PRBMathSD59x18Typed.sol";

contract MarginEngineCallee {


    // view functions

    function getAMMAddressCallee(address marginEngineAddress) external view returns (address){
        return address(IMarginEngine(marginEngineAddress).amm());
    }

    // non-view functions

    function setAMMCallee(address marginEngineAddress, address ammAddress) external {
        IMarginEngine(marginEngineAddress).setAMM(ammAddress);
    }


}