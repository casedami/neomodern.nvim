#!/bin/bash

nvim -c "lua require('neomodern.extras').generate()" -c "q"
git commit -a "chore(extras): auto-gen"
