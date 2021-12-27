// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../interfaces/rate_oracles/IRateOracle.sol";
import "../core_libraries/FixedAndVariableMath.sol";
import "prb-math/contracts/PRBMathUD60x18.sol";

/// @notice Common contract base for a Rate Oracle implementation.
/// @dev Each specific rate oracle implementation will need to implement the virtual functions

abstract contract BaseRateOracle is IRateOracle {

    bytes32 public immutable override rateOracleId;
    address immutable underlying;
    uint256 public override secondsAgo;
    // override
    OracleVars public oracleVars;
    // override
    Rate[65535] public rates;

    struct Rate {
        uint256 timestamp; /// In wei-seconds
        uint256 rateValue; // In wei
    }

    // should be controlled by the owner
    function setSecondsAgo(uint256 _secondsAgo) external override {

        secondsAgo =  _secondsAgo;

        // emit seconds ago set
        // specify the rate oracle id and the underlying address
    }

    constructor(bytes32 _rateOracleId, address _underlying) {
        rateOracleId = _rateOracleId;
        underlying = _underlying;
    }

    struct OracleVars {
        
        // the most-recently updated index of the rates array
        uint16 rateIndex;

        // the current maximum number of rates that are being stored
        uint16 rateCardinality;

        // the next maximum number of rates to store, triggered in rates.write 
        uint16 rateCardinalityNext;

    }
    
    function variableFactor(bool atMaturity, address underlyingToken, uint256 termStartTimestamp, uint256 termEndTimestamp) public virtual override returns(uint256 result);


    function grow(
        uint16 current,
        uint16 next
    ) internal returns (uint16) {
        require(current > 0, "I");

        // no-op if the passed next value isn't greater than the current next value
        if (next <= current) return current;

        // store in each slot to prevent fresh SSTOREs in swaps 
        // this data will not be used because the initialized boolean is still false
        for (uint16 i = current; i < next; i++) rates[i].timestamp = 1;

        return next;

    }

    
    // add override, lock the amm when calling this function, noDelegateCall
    function increaseObservarionCardinalityNext(uint16 rateCardinalityNext) external {
        uint16 rateCardinalityNextOld = oracleVars.rateCardinalityNext; // for the event

        uint16 rateCardinalityNextNew = grow(rateCardinalityNextOld, rateCardinalityNext);

        oracleVars.rateCardinalityNext = rateCardinalityNextNew;

        // if (rateCardinalityNextOld != rateCardinalityNextNew)
            // emit IncreaserateCardinalityNext(rateCardinalityNextOld, rateCardinalityNextNew);
    }

    /// @notice Calculates the observed APY returned by the underlying in a given period
    /// @param underlying The address of an underlying ERC20 token known to this Oracle (e.g. USDC not aaveUSDC)
    /// @param from The timestamp of the start of the period, in wei-seconds
    /// @param to The timestamp of the end of the period, in wei-seconds
    function getApyFromTo(
        address underlying,
        uint256 from,
        uint256 to
    ) internal view virtual returns (uint256 apyFromTo);
    
    
    function writeRate(
        uint16 index,
        uint16 cardinality,
        uint16 cardinalityNext
    ) public virtual returns (uint16 indexUpdated, uint16 cardinalityUpdated);


    function observeSingle(
        uint256 currentTime,
        uint256 queriedTime,
        uint16 index,
        uint16 cardinality,
        uint16 cardinalityNext
    ) public virtual returns(uint256 rateValue);


}
