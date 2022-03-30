// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "../IERC20Extended.sol";


interface ICToken {

  // Documentation: https://compound.finance/docs/ctokens#exchange-rate
  // Interface: https://github.com/compound-finance/compound-protocol/blob/master/contracts/CTokenInterfaces.sol#L233

    // function transfer(address dst, uint amount) external returns (bool);
    // function transferFrom(address src, address dst, uint amount) external returns (bool);
    // function approve(address spender, uint amount) external returns (bool);
    // function allowance(address owner, address spender) external view returns (uint);
    // function balanceOf(address owner) external view returns (uint);
    // function balanceOfUnderlying(address owner) external returns (uint);
    // function getAccountSnapshot(address account) external view returns (uint, uint, uint, uint);
    // function borrowRatePerBlock() external view returns (uint);
    // function supplyRatePerBlock() external view returns (uint);
    // function totalBorrowsCurrent() external returns (uint);
    // function borrowBalanceCurrent(address account) external returns (uint);
    // function borrowBalanceStored(address account) external view returns (uint);
    // function exchangeRateCurrent() external returns (uint);
    function exchangeRateStored() external view returns (uint);
    // function getCash() external view returns (uint);
    // function accrueInterest() external returns (uint);
    // function seize(address liquidator, address borrower, uint seizeTokens) external returns (uint);
    // https://github.com/compound-finance/compound-protocol/blob/master/contracts/CTokenInterfaces.sol#L263
    function redeemUnderlying(uint redeemAmount) external returns (uint);

}