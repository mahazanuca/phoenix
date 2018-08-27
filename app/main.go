package main

func main() {
	a := App{}
	a.Initialize("mysql", "123456", "phoenix_api")
	a.Run(":8000")
}
