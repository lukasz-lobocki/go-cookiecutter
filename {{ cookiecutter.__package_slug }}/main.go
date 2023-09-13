package main

var (
	semVer, commitHash     string
	isGitDirty, isSnapshot string
	goOs, goArch           string
	gitUrl, builtBranch    string
	builtDate              string
)

var semReleaseVersion string = semVer +
	func(pre string, txt string) string {
		if len(txt) > 0 {
			return pre + txt
		} else {
			return ""
		}
	}("+", goArch) +
	func(pre string, txt string) string {
		if len(txt) > 0 {
			return pre + txt
		} else {
			return ""
		}
	}(".", commitHash)

func main() {
	println("release version:", semReleaseVersion)
	println()
	println("semVer:", semVer, "commitHash:", commitHash)
	println("isGitDirty:", isGitDirty, "isSnapshot:", isSnapshot)
	println("goOs:", goOs, "goArch:", goArch)
	println("gitUrl:", gitUrl, "builtBranch:", builtBranch)
	println("builtDate:", builtDate)
}
