import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";
import { ethers } from "hardhat";
import { Factory } from "../typechain";
import { getAaveTokens } from "./config";

const func: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deploy } = hre.deployments;
  const { deployer } = await hre.getNamedAccounts();
  const doLogging = true;
  const aaveTokens = getAaveTokens();
  let rateOracle = await ethers.getContractOrNull("TestRateOracle");
  const factory = (await ethers.getContract("Factory")) as Factory;

  if (!rateOracle && aaveTokens) {
    for (const token of aaveTokens) {
      const rateOracleIdentifier = `AaveRateOracle_${token.name}`;
      rateOracle = await ethers.getContractOrNull(rateOracleIdentifier);

      if (rateOracle) {
        break;
      }
    }
  }

  if (!rateOracle) {
    throw Error("Could not find rate oracle to associate with Aave FCM");
  }

  const masterAaveFCM = await deploy("AaveFCM", {
    from: deployer,
    log: doLogging,
  });

  await factory.setMasterFCM(masterAaveFCM.address, rateOracle.address);
  return true; // Only execute once
};
func.tags = ["FCMs"];
func.id = "FCMs";
export default func;