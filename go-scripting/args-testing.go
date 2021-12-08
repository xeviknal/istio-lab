package main

import "os"
import "fmt"

var availableArgs map[string]bool

func main() {
	args := os.Args

	availableArgs = map[string]bool{
		"-p": false,
		"-j": false,
	}

	// Registering used flags
	for _, arg := range args {
		if _, found := availableArgs[arg]; found {
			availableArgs[arg] = true
		}
	}

	if flagPresent("-p") {
		fmt.Println("Scenario for -p")
	}

	if flagPresent("-j") {
		fmt.Println("Scenario for -j")
	}
}

func flagPresent(flag string) bool {
	val, found := availableArgs[flag]
	return found && val
}
