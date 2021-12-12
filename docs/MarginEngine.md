# MarginEngine









## Methods

### LIQUIDATOR_REWARD

```solidity
function LIQUIDATOR_REWARD() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined

### amm

```solidity
function amm() external view returns (contract IAMM)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract IAMM | undefined

### checkPositionMarginRequirementSatisfied

```solidity
function checkPositionMarginRequirementSatisfied(address recipient, int24 tickLower, int24 tickUpper, uint128 amount) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| recipient | address | undefined
| tickLower | int24 | undefined
| tickUpper | int24 | undefined
| amount | uint128 | undefined

### liquidatePosition

```solidity
function liquidatePosition(IPositionStructs.ModifyPositionParams params) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| params | IPositionStructs.ModifyPositionParams | undefined

### liquidateTrader

```solidity
function liquidateTrader(address traderAddress) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| traderAddress | address | undefined

### positions

```solidity
function positions(bytes32) external view returns (uint128 _liquidity, int256 margin, int256 fixedTokenGrowthInsideLast, int256 variableTokenGrowthInsideLast, int256 fixedTokenBalance, int256 variableTokenBalance, uint256 feeGrowthInsideLast, bool isBurned)
```

Returns the information about a position by the position&#39;s key



#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | bytes32 | undefined

#### Returns

| Name | Type | Description |
|---|---|---|
| _liquidity | uint128 | undefined
| margin | int256 | undefined
| fixedTokenGrowthInsideLast | int256 | undefined
| variableTokenGrowthInsideLast | int256 | undefined
| fixedTokenBalance | int256 | undefined
| variableTokenBalance | int256 | undefined
| feeGrowthInsideLast | uint256 | undefined
| isBurned | bool | undefined

### setAMM

```solidity
function setAMM(address _ammAddress) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _ammAddress | address | undefined

### settlePosition

```solidity
function settlePosition(IPositionStructs.ModifyPositionParams params) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| params | IPositionStructs.ModifyPositionParams | undefined

### settleTrader

```solidity
function settleTrader(address recipient) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| recipient | address | undefined

### traders

```solidity
function traders(bytes32) external view returns (int256 margin, int256 fixedTokenBalance, int256 variableTokenBalance, bool isSettled)
```

Returns the information about a trader by the trader key



#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | bytes32 | undefined

#### Returns

| Name | Type | Description |
|---|---|---|
| margin | int256 | undefined
| fixedTokenBalance | int256 | undefined
| variableTokenBalance | int256 | undefined
| isSettled | bool | undefined

### unwindPosition

```solidity
function unwindPosition(address owner, int24 tickLower, int24 tickUpper) external nonpayable returns (int256 _fixedTokenBalance, int256 _variableTokenBalance)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined
| tickLower | int24 | undefined
| tickUpper | int24 | undefined

#### Returns

| Name | Type | Description |
|---|---|---|
| _fixedTokenBalance | int256 | undefined
| _variableTokenBalance | int256 | undefined

### updatePosition

```solidity
function updatePosition(IPositionStructs.ModifyPositionParams params, IVAMM.UpdatePositionVars vars) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| params | IPositionStructs.ModifyPositionParams | undefined
| vars | IVAMM.UpdatePositionVars | undefined

### updatePositionMargin

```solidity
function updatePositionMargin(IPositionStructs.ModifyPositionParams params, int256 marginDelta) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| params | IPositionStructs.ModifyPositionParams | undefined
| marginDelta | int256 | undefined

### updateTraderBalances

```solidity
function updateTraderBalances(address recipient, int256 fixedTokenBalance, int256 variableTokenBalance) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| recipient | address | undefined
| fixedTokenBalance | int256 | undefined
| variableTokenBalance | int256 | undefined

### updateTraderMargin

```solidity
function updateTraderMargin(address recipient, int256 marginDelta) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| recipient | address | undefined
| marginDelta | int256 | undefined




## Errors

### PRBMathSD59x18__MulInputTooSmall

```solidity
error PRBMathSD59x18__MulInputTooSmall()
```

Emitted when one of the inputs is MIN_SD59x18.




### PRBMathSD59x18__MulOverflow

```solidity
error PRBMathSD59x18__MulOverflow(uint256 rAbs)
```

Emitted when the intermediary absolute result overflows SD59x18.



#### Parameters

| Name | Type | Description |
|---|---|---|
| rAbs | uint256 | undefined |

### PRBMathUD60x18__SubUnderflow

```solidity
error PRBMathUD60x18__SubUnderflow(uint256 x, uint256 y)
```

Emitted when subtraction underflows UD60x18.



#### Parameters

| Name | Type | Description |
|---|---|---|
| x | uint256 | undefined |
| y | uint256 | undefined |

### PRBMath__MulDivFixedPointOverflow

```solidity
error PRBMath__MulDivFixedPointOverflow(uint256 prod1)
```

Emitted when the result overflows uint256.



#### Parameters

| Name | Type | Description |
|---|---|---|
| prod1 | uint256 | undefined |

