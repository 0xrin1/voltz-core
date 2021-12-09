// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../utils/SafeCast.sol";
import "../utils/TickMath.sol";
import "../interfaces/IAMM.sol";
import "../interfaces/IVAMM.sol";
import "../interfaces/IPositionStructs.sol";
import "../AMM.sol";

contract TestAMMCallee is AMM {
    using SafeCast for uint256;

    function mintTest(
        address amm,
        address recipient,
        int24 tickLower,
        int24 tickUpper,
        uint128 amount
    ) external {
        IAMM(amm).mint(
            recipient,
            tickLower,
            tickUpper,
            amount
        );
    }

    // function updatePositionTest(IPositionStructs.ModifyPositionParams memory params) external returns(Position.Info memory position) {
    //     return _updatePosition(params);
    // }

    function swapExact0For1(
        address amm,
        uint256 amount0In,
        address recipient,
        uint160 sqrtPriceLimitX96
    ) external {
        IVAMM.SwapParams memory params = IVAMM.SwapParams({
            recipient: recipient,
            isFT: true,
            amountSpecified: amount0In.toInt256(),
            sqrtPriceLimitX96: sqrtPriceLimitX96,
            isUnwind: false,
            isTrader: true
        });

        IAMM(amm).swap(params);
    }

    function swap0ForExact1(
        address amm,
        uint256 amount1Out,
        address recipient,
        uint160 sqrtPriceLimitX96
    ) external {
        IVAMM.SwapParams memory params = IVAMM.SwapParams({
            recipient: recipient,
            isFT: true,
            amountSpecified: -amount1Out.toInt256(),
            sqrtPriceLimitX96: sqrtPriceLimitX96,
            isUnwind: false,
            isTrader: true
        });

        IAMM(amm).swap(params);
    }

    function swapExact1For0(
        address amm,
        uint256 amount1In,
        address recipient,
        uint160 sqrtPriceLimitX96
    ) external {
        IVAMM.SwapParams memory params = IVAMM.SwapParams({
            recipient: recipient,
            isFT: false,
            amountSpecified: amount1In.toInt256(),
            sqrtPriceLimitX96: sqrtPriceLimitX96,
            isUnwind: false,
            isTrader: true
        });

        IAMM(amm).swap(params);
    }

    function swap1ForExact0(
        address amm,
        uint256 amount0Out,
        address recipient,
        uint160 sqrtPriceLimitX96
    ) external {
        IVAMM.SwapParams memory params = IVAMM.SwapParams({
            recipient: recipient,
            isFT: false,
            amountSpecified: -amount0Out.toInt256(),
            sqrtPriceLimitX96: sqrtPriceLimitX96,
            isUnwind: false,
            isTrader: true
        });

        IAMM(amm).swap(params);
    }

    function swapToLowerSqrtPrice(
        address amm,
        uint160 sqrtPriceX96,
        address recipient
    ) external {
        IVAMM.SwapParams memory params = IVAMM.SwapParams({
            recipient: recipient,
            isFT: true,
            amountSpecified: type(int256).max,
            sqrtPriceLimitX96: sqrtPriceX96,
            isUnwind: false,
            isTrader: true
        });

        IAMM(amm).swap(params);
    }

    function swapToHigherSqrtPrice(
        address amm,
        uint160 sqrtPriceX96,
        address recipient
    ) external {
        IVAMM.SwapParams memory params = IVAMM.SwapParams({
            recipient: recipient,
            isFT: false,
            amountSpecified: type(int256).max,
            sqrtPriceLimitX96: sqrtPriceX96,
            isUnwind: false,
            isTrader: true
        });

        IAMM(amm).swap(params);
    }
}
