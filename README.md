# overcommit-hooks
Custom hooks for [overcommit](https://github.com/brigade/overcommit).

## PreCommit
Name         | Description
------------ | -----------
SearchPattern | Match each modified line against list of regular expressions

### SearchPattern

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

## LEGAL

Distributed freely under the [kopimi](http://kopimi.com) [LICENSE](LICENSE.md).
