package main

var (
	semVer, commitHash  string
	goOs, goArch        string
	gitUrl, builtBranch string
	builtDate, builtBy  string
)

func main() {
	println("semVer", semVer, "commitHash", commitHash)
	println("goOs", goOs, "goArch", goArch)
	println("gitUrl", gitUrl, "builtBranch", builtBranch)
	println("builtDate", builtDate, "builtBy", builtBy)
}
