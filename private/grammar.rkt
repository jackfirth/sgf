#lang brag


collection: game-tree+
game-tree: /"(" sequence game-tree* /")"
sequence: node+
node: /";" property*
property: PROPERTY-IDENTIFIER property-value+
@property-value: NUMBER | COLOR | SIMPLE-TEXT
