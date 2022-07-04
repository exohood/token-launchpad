module.exports = {
  networks: {
    development: {
      privateKey: '6C8D12076A9DE6447EB5CBB3688763E23B74B27503EF627B0274B7817D74DB78',
      consume_user_resource_percent: 30,
      fee_limit: 100000000,

      fullHost: "http://127.0.0.1:9090",

      network_id: "*"
    },
    testnet: {
      privateKey: 'CB0712E1242A4B52BA44F4F477999864B987A9BDB7D886624A903B5889C302FA',
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
