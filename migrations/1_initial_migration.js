const Migrations = artifacts.require("Migrations");
const KG = artifacts.require("KG");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(KG);
};
