pragma solidity ^0.8.0;

/// @title An interface for a contract that is capable of deploying Voltz AMMs
/// @notice A contract that constructs an AMM must implement this to pass arguments to the pool
/// @dev This is used to avoid having constructor arguments in the pool contract, which results in the init code hash
/// of the pool being constant allowing the CREATE2 address of the pool to be cheaply computed on-chain
interface IAMMDeployer {
    /// @notice Get the parameters to be used in constructing the pool, set transiently during pool creation.
    /// @dev Called by the pool constructor to fetch the parameters of the pool
    /// Returns factory The factory address
    /// Returns underlyingToken Address of the underlying token
    /// Returns underlyingPool Address of the underlying pool
    /// Returns termEndTimestamp number of days from inception of the pool till maturity
    /// Returns termStartTimestamp Datetime of pool's inception
    /// Returns fee The fee collected upon every swap in the pool, denominated in hundredths of a bip
    /// Returns tickSpacing The minimum number of ticks between initialized ticks
    function parameters()
        external
        view
        returns (
            address factory,
            address underlyingToken,
            address underlyingPool,
            uint256 termStartTimestamp,
            uint256 termEndTimestamp,
            uint24 fee,
            int24 tickSpacing
        );
} 