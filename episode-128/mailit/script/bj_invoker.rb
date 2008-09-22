@routing = Workling::Starling::Routing::ClassAndMethodRouting.new
unnormalized = REXML::Text::unnormalize(STDIN.read)
message, command, args = *unnormalized.match(/(^[^ ]*) (.*)/)
options = Hash.from_xml(args)["hash"]

if workling = @routing[command]
  workling.send @routing.method_name(command), options.symbolize_keys
end