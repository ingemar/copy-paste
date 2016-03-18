require 'color_puts'

module CopyPaste
  include ColorPuts

  def _cp(obj = Readline::HISTORY.entries[-2], *options)
    if obj.respond_to?(:join) && !options.include?(:a)
      if options.include?(:s)
        obj = obj.map { |element| ":#{element.to_s}" }
      end
      out = obj.join(", ")
    elsif obj.respond_to?(:inspect)
      out = obj.is_a?(String) ? obj : obj.inspect
    end

    if out
      IO.popen('pbcopy', 'w') { |io| io.write(out) }
      "copied!"
    end
  end

  def _cp_help
    cputs <<-HELP


  %white{_cp - copy stuff to OS X clipboard}


  If no argument is given it takes the last line in HISTORY:
    >> 5.times { "nothing"  }
    # => 5
    >> _cp
    # => "copied!"
    Pasteboard: 5.times { "nothing"  }

  Copy the result of the given argument:
    >> _cp ["foo", "bar"]
    # => "copied!"
    Pasteboard: foo, bar

  Convert array elements to symbols:
    >> _cp ["foo", "bar"], :s
    # => "copied!"
    Pasteboard: :foo, :bar

  Copy an array as syntax:
    >> _cp ["foo", "bar"], :a
    # => "copied!"
    Pasteboard: ["foo", "bar"]


  Copy a hash:
    >> h={:foo=>"bar", "foo"=>:bar}
    # => {:foo=>"bar", "foo"=>:bar}
    # >> _cp h
    # => "copied!"
    Pasteboard: {:foo=>"bar", "foo"=>:bar}


    HELP
  end

  def self.included(base)
    cputs "%white{_cp} command available, type '%white{_cp_help}' for more info"
  end
end

require "copy-paste/version"
