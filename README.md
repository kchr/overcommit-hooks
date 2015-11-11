# overcommit-hooks
Custom hooks for [overcommit](https://github.com/brigade/overcommit).

Feel free to submit your own! Just make a pull request. :-)

## PreCommit

Name         | Description
------------ | -----------
SearchPattern | Match each modified line against list of regular expressions

### SearchPattern

Search files staged to commit for a list of regex patterns.

Matches found in _modified_ lines are considered to be errors. If an
_unmodified_ line in a file staged for commit matches, it will show as a
warning.

#### Configuration

In your `.overcommit.yml`:

```yaml
PreCommit:
  SearchPattern:
    enabled: true
    description: 'Checking for string matches'
    include: '**/*.rb'
    patterns:
      - "@FIXME"
      - "@NOTE"
      - "require 'pp'"
```
