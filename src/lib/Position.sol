// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.14;

library Position {
    struct Info {
        uint128 liquidity; // 记录的是，用户在这tick区间 的流动性
    }

    function get(mapping(bytes32 => Info) storage self, address owner, int24 lowerTick, int24 upperTick)
        internal
        view
        returns (Position.Info storage position)
    {
        position = self[keccak256(abi.encodePacked(owner, lowerTick, upperTick))];
    }

    function update(Info storage self, uint128 liquidityDelta) internal {
        uint128 liquidityBefore = self.liquidity;
        uint128 liquidityAfter = liquidityBefore + liquidityDelta;

        self.liquidity = liquidityAfter;
    }
}
