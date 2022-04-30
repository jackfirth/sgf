#lang brag


collection: sgf-game-tree+
sgf-game-tree: /"(" sgf-node-list sgf-variation-list /")"
sgf-node-list: sgf-node+
sgf-variation-list: sgf-game-tree*
sgf-node: /";" sgf-property-list
sgf-property-list: sgf-property*
sgf-property: sgf-property-identifier sgf-property-value-list
sgf-property-identifier: PROPERTY-IDENTIFIER
sgf-property-value-list: sgf-property-value+
@sgf-property-value: NUMBER | COLOR | SIMPLE-TEXT
