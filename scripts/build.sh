#!/bin/bash

nvim -c "lua require('neomodern.extras').generate()" -c "q"
git commit -am "chore(extras): auto-gen"
