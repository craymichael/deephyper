#!/bin/bash

python -m deephyper.search.nas.ambs --problem deephyper.benchmark.nas.linearReg.Problem --evaluator subprocess --max-evals 5
