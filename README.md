# Tyranid Obscure Bio‑Fact Log

An on-chain archive of obscure and surprising Tyranid biological facts.  
Users submit rare bio‑lore, strange adaptations, and unusual hive behaviors.  
The community votes each entry as **interesting** or **unremarkable**, shaping the Hive Mind’s collective curiosity.

Fully text-based, permissionless, and built for creative Warhammer 40K world-building on Base.

---

## Contract

Deployed on Base:  
`0xb88d54eb64ebcca139bfd22646528c58d125156e`  
https://basescan.org/address/0xb88d54eb64ebcca139bfd22646528c58d125156e#code

Main file: `contracts/TyranidBioFactLog.sol`

---

## How it works

Each bio‑fact entry stores:

- `title` – Short name of the fact  
- `fact` – The obscure Tyranid detail  
- `sourceHint` – Optional reference or lore hint  
- `interesting` / `dull` – Community votes  

Entry **0** is a built‑in example.

---

## Example

```solidity
recordBioFact(
  "Hive Ship Dreaming",
  "Some Hive Ships enter a semi-conscious state where they simulate future battlefields before arrival.",
  "Void observations from Leviathan fleets"
);
Vote:

solidity
voteBioFact(1, true);   // Interesting

Closing Note
A shard of the Hive Mind preserved on-chain —
a living archive of strange biology, forgotten adaptations, and hidden truths.
Every fact deepens the swarm’s understanding.
