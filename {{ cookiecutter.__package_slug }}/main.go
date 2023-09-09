package main

var (
	semVer      string
	commitHash  string
	gitUrl      string
	builtBranch string
	builtDate   string
	builtBy     string
)

func main() {
	println("semVer", semVer, "commitHash", commitHash)
	println("gitUrl", gitUrl, "builtBranch", builtBranch)
	println("builtDate", builtDate, "builtBy", builtBy)
}
