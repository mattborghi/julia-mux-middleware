# Check web socket server implementation
# https://github.com/JuliaWeb/WebSockets.jl/blob/master/examples/minimal_server.jl

# Also check this package
# https://github.com/JuliaWeb/HTTP.jl


using HTTP

HTTP.WebSockets.open("ws://127.0.0.1:8081") do ws
   write(ws, "Hello")
   x = readavailable(ws)
   @show x
   println(String(x))
end;


@async HTTP.WebSockets.listen("127.0.0.1", UInt16(3000)) do ws
   while !eof(ws)
       data = readavailable(ws)
       write(ws, data)
   end
end
