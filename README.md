# NFT

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=541882458&machine=standardLinux32gb&devcontainer_path=.devcontainer%2Fdevcontainer.json&location=WestUs2)

A non-fungible token (NFT) is a record on a blockchain which is associated with a particular digital or physical asset. 

This repo will enable you to build a simple NFT marketplace like [opensea.io](https://opensea.io/) with Truffle, Ganache and NodeJS as frontend.

Here is a screen shot of the DApp running.

## Getting Started

Create Codespaces on main branch and start.

Run your app with local debugging by pressing `F5` in VSCode. Or `Run and Debug` and select `Launch frontend`.

**Congratulations**! You are running an NFT marketplace that users can get a Free NFT as giveaways.

## Understanding the code

This section walks through the generated code. The project folder contains the following:

| Folder | Contents |
| - | - |
| `.vscode` | VSCode files for local debug |
| `contracts` | The Solidity source files for NFT smart contracts |
| `migrations` | Migration system is used to handle smart contract deployments. A migration is an additional special smart contract that keeps track of changes. |
| `src` | Frontend code to contain the DApp |
| `test` | Contains both JavaScript and Solidity tests for the smart contracts |
