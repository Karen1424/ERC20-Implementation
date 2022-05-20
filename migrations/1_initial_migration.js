const Migrations = artifacts.require("Migrations");
const KG = artifacts.require("KG");
const Market = artifacts.require("Market");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(KG);
  deployer.deploy(Market);
};
