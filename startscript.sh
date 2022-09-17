#!/bin/bash
mkdir github
cd github
git clone $GITHUB
cd *
make dockertest
