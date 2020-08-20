## Objects

### *Parser*

This is the "orchestrator of the process".
Receives a validates a filename will print the visit reports to the console. 

```
.call(filename) -> Will output the visits report to the console
```

### *Log*

Can be initialized with a filename (assumes the filename has been already validated)

```
#lines -> returns a collection of Log::Line objects read from the input file matching the expected format
```

### *ErrorSerializer*
Serilizes a giver message to be displayed in the console.
```
.call("Some error message")
