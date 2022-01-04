module.exports = {
  networks: {
    development: {
      privateKey: 'da146374a75310b9666e834ee4ad0866d6f4035967bfc76217c5a495fff9f0d0',
      consume_user_resource_percent: 30,
      fee_limit: 100000000,

      fullHost: "http://127.0.0.1:9090",

      network_id: "*"
    },
    testnet: {
      privateKey: 'da146374a75310b9666e834ee4ad0866d6f4035967bfc76217c5a495fff9f0d0',
      consume_user_resource_percent: 30,
      fee_limit: 100000000,

      fullHost: "http://testnet.tronish.io",

      network_id: "*"
    },
    compilers: {
        solc: {
            version: '0.4.25' // for compiler version
        }
    }
  },
  solc: {
    optimizer: {
        enabled: true, // enable solc optimize, default: false
        runs: 200
    }
  }
};
