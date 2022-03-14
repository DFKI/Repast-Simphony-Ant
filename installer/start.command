#!/bin/bash

# Repast Simphony Model run script for macOS and Linux

# PWD="${0%/*}"
# cd "$PWD"

# Note the Repast Simphony Directories.
REPAST_SIMPHONY_ROOT=/Applications/Repast\ Simphony\ 2.9.0/Eclipse.app/Contents/Eclipse/plugins/repast.simphony.runtime_2.9.0

# Define the Core Repast Simphony Directories and JARs
CP=$CP:$REPAST_SIMPHONY_ROOT/bin
CP=$CP:$REPAST_SIMPHONY_ROOT/lib/*

# Groovy jar
CP=$CP:/Applications/Repast\ Simphony\ 2.9.0/Eclipse.app/Contents/Eclipse/plugins/org.codehaus.groovy_3.0.9.v202109301428-e2106-RELEASE/lib/groovy-3.0.9-indy.jar

# User model lib jars
CP=$CP:lib/*


# Start the Model
java -XX:+IgnoreUnrecognizedVMOptions --add-modules=ALL-SYSTEM --add-exports=java.base/jdk.internal.ref=ALL-UNNAMED -cp "$CP" repast.simphony.runtime.RepastMain  "./JZombies_Demo.rs"
