package main

var version string
var commit string
var date string
var builtBy string
var branch string
var gitUrl string
var semVer string

func main() {
	println("ver", version, "commit", commit, "date", date, "builtBy", builtBy, "branch", branch, "gitUrl", gitUrl, "semVer", semVer)
}
