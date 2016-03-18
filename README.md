# copy-paste

Move stuff from irb or pry to your pasteboard (the Clipboard) in OS X

## Installation

First, grab the gem:
```
$ gem install copy-paste
```

Create or edit your `.irbrc` or `.pryrc` file and enter the following two lines to load copy-paste:

```
require 'copy-paste'
include CopyPaste
```

Now you can copy stuff from your interactive console, like last typed line by invoking `_cp` or dump the content of a variable to your pasteboard.


## Manual

This text can be displayed in you console by calling `_cp_help`.

If no argument is given it takes the last line in `HISTORY`:
```ruby
>> 5.times { "nothing"  }
# => 5
>> _cp
# => "copied!"
```
Pasteboard: `5.times { "nothing"  }`


Copy the result of the given argument:
```ruby
>> _cp ["foo", "bar"]
# => "copied!"
```
Pasteboard: `foo, bar`


Convert array elements to symbols:
```ruby
>> _cp ["foo", "bar"], :s
# => "copied!"
```
Pasteboard: `:foo, :bar`


Copy an array as syntax:
```ruby
>> _cp ["foo", "bar"], :a
# => "copied!"
```
Pasteboard: `["foo", "bar"]`


Copy a hash:
```ruby
>> h={:foo=>"bar", "foo"=>:bar}
# => {:foo=>"bar", "foo"=>:bar}
# >> _cp h
# => "copied!"
```
Pasteboard: `{:foo=>"bar", "foo"=>:bar}`


## Contributing

Contributions always welcome!
