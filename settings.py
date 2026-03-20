from src.hello import HelloMessage, HelloOperation

REMOTE_SETTINGS = {
	"url": "http://localhost:80",
	"username": "SuperUser",
	"password": "SYS",
	"namespace": "USER",
}

CLASSES = {
	"Python.Hello.HelloOperation": HelloOperation,
}

SCHEMAS = [HelloMessage]

PRODUCTIONS = [
	{
		'Python.Production': {
			"@TestingEnabled": "true",
			"Item": [
				{
					"@Name": "Hello.Operation",
					"@ClassName": HelloOperation,
				}
			],
		}
	} 
]