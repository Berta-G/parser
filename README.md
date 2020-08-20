## Usage

From root directory:
- Installation: `bundle install`
- run tests: `rspec`
- run script: `ruby run.rb <path to file>`

## Objects

### *Parser*

This is the "orchestrator of the process".
Receives a validates a filename will print the visit reports to the console. 

```
.call(filename) -> Will output the visits report to the console
```

### *Log*

To be initialized with a filename (assumes the filename has been already validated)

```
#lines -> returns a collection of Log::Line objects read from the input file matching the expected format
```

### *Report*

To be initialized with log: instance of Log and a key to express the kind of report to be generated.

Available keys: [:pages_most_visited_overall, :pages_most_visited_unique]

```
#title -> String (Title of the report based on the givel key)
```

```
#lines -> returns a collection of Report::Line objects represending the report requested in key.
```

### *ErrorSerializer*
Serilizes a giver message to be displayed in the console.
```
.call("Some error message")
