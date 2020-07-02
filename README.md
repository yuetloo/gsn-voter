# GSN Voter

This example (https://yuetloo.github.io/gsn-voter/) shows the usage of [ethers.js](https://github.com/ethers-io/ethers.js) GSN signer.

See [EIP 1613: Gas Stations network](https://eips.ethereum.org/EIPS/eip-1613) or [OpenGsn](https://docs.opengsn.org/learn/index.html) for more details about GSN. GSN enables accounts that do not own ether to be able to call state changing functions in the contracts that implement the GsnRecipient interface.

The contract, Voting.sol, implements the GsnRecipient interface.

The index.html file contains all the javascript logic to create the GSN signer and send the transaction to the GSN relayer.

## How the App Works

1. Currently, the app only works in the ropsten network
2. A new random account will be created to sign the transaction
3. The transaction fee will be paid for by the Voting contract

## Contracts

A test contract, Voting, that implements the GsnRecipient interface. It has functions to vote yes or no for a subject.

The following in the contract folders are from [Openzeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts):

1. contracts/Context.sol
2. contracts/GSNRecipient.sol
3. contracts/IRelayHub.sol
4. contracts/IRelayRecipient.sol
5. contracts/Initializable.sol

## Bin

This folder contains a script to create the contract and fund the Relay Hub. See following section for instructions to fund the relay hub

## How to Deploy the Contract

The following example shows how to deploy to the ropsten testnet. To deploy to a different network, supply your network using the `--network` switch.

1. Deploy the Storage.sol contract

   - run the following command line
     ```
     bin/gsn-cli.js deploy --network ropsten --account {json wallet path}
     ```

2. Fund the Relay Hub
   - Need to fund the newly created contract (from step 1) in the Relay Hub
   ```
     bin/gsn-cli.js fund {contract address from step 1} [amount to fund in ether] --account {json wallet path} --network ropsten
   ```

## GSN Networks

This example currently only supports GSN 1.0 network. The list of relay hubs for different environment can be found here: [GSN 1.0 networks](https://docs.opengsn.org/gsn-provider/networks.html#gsn_1_0). For GSN 1.0, relay hubs for all networks have the same address: `0xD216153c06E857cD7f72665E0aF1d7D82172F494`.

## Notes

The ethers.js experimental javascript library is downloaded from the npm repo [@yuetloo](https://www.npmjs.com/package/@yuetloo/ethers-experimental) because the pull request containing GSN signer implementation has not been added to the ethers.js library yet.

## License

MIT
