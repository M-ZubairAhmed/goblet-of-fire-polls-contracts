module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*",
    },
    develop: {
      port: 8545,
    },
  },
  contracts_build_directory: "../goblet-of-fire-polls-client/src/_abi/",
  contracts_directory: "./src",
};
